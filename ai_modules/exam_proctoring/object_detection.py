"""
Object Detection Module
Detects phones and other prohibited objects using OpenCV.
For production, use a YOLO or SSD model for accurate detection.
"""
import cv2
import numpy as np


class ObjectDetector:
    """
    Simple object detection using background subtraction and contour analysis.
    For production, integrate YOLOv5/v8 for phone, book, and person detection.
    """

    def __init__(self):
        self.face_cascade = cv2.CascadeClassifier(
            cv2.data.haarcascades + 'haarcascade_frontalface_default.xml'
        )
        self.upper_body_cascade = cv2.CascadeClassifier(
            cv2.data.haarcascades + 'haarcascade_upperbody.xml'
        )

    def detect_multiple_people(self, image):
        """Detect if multiple people are visible in the frame."""
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        faces = self.face_cascade.detectMultiScale(
            gray, scaleFactor=1.1, minNeighbors=5, minSize=(60, 60)
        )
        return {
            'multiple_people': len(faces) > 1,
            'face_count': len(faces),
            'no_face': len(faces) == 0,
        }

    def detect_phone(self, image):
        """
        Heuristic phone detection based on rectangular contours near face region.
        This is a simplified approach — production systems should use YOLO.
        """
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        edges = cv2.Canny(gray, 50, 150)
        contours, _ = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

        img_h, img_w = image.shape[:2]
        phone_detected = False

        for contour in contours:
            area = cv2.contourArea(contour)
            if area < 3000 or area > img_h * img_w * 0.3:
                continue

            # Approximate the contour shape
            peri = cv2.arcLength(contour, True)
            approx = cv2.approxPolyDP(contour, 0.02 * peri, True)

            # Phone-like objects are rectangular (4 vertices)
            if len(approx) == 4:
                x, y, w, h = cv2.boundingRect(approx)
                aspect = w / h if h > 0 else 0

                # Phone aspect ratio is typically 0.4-0.6 (portrait) or 1.7-2.2 (landscape)
                if (0.35 <= aspect <= 0.65) or (1.6 <= aspect <= 2.3):
                    # Check if it's in the hand region (lower half or sides)
                    center_y = y + h // 2
                    if center_y > img_h * 0.3:
                        phone_detected = True
                        break

        return {'phone_detected': phone_detected}

    def detect_background_person(self, image):
        """Detect people in the background using upper body detection."""
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        faces = self.face_cascade.detectMultiScale(gray, 1.1, 5, minSize=(40, 40))

        if len(faces) <= 1:
            return {'background_person': False}

        # If more than one face, check if additional faces are smaller (further away)
        if len(faces) > 1:
            areas = [w * h for (x, y, w, h) in faces]
            main_face_area = max(areas)
            background_faces = sum(1 for a in areas if a < main_face_area * 0.5)
            return {
                'background_person': background_faces > 0,
                'background_count': background_faces,
            }

        return {'background_person': False}
