"""
Eye Tracking Module
Detects eye gaze direction using OpenCV Haar cascades.
For production, consider using MediaPipe Face Mesh for higher accuracy.
"""
import cv2
import numpy as np


class EyeTracker:
    def __init__(self):
        self.face_cascade = cv2.CascadeClassifier(
            cv2.data.haarcascades + 'haarcascade_frontalface_default.xml'
        )
        self.eye_cascade = cv2.CascadeClassifier(
            cv2.data.haarcascades + 'haarcascade_eye.xml'
        )

    def detect_eye_gaze(self, image):
        """
        Analyze eye gaze direction.
        Returns: dict with gaze info and whether looking away.
        """
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        faces = self.face_cascade.detectMultiScale(gray, 1.1, 5, minSize=(80, 80))

        if len(faces) == 0:
            return {'looking_away': True, 'reason': 'no_face_detected', 'confidence': 1.0}

        x, y, w, h = faces[0]
        face_roi = gray[y:y+h, x:x+w]

        eyes = self.eye_cascade.detectMultiScale(face_roi, 1.1, 5, minSize=(20, 20))

        if len(eyes) < 2:
            return {'looking_away': True, 'reason': 'eyes_not_visible', 'confidence': 0.7}

        # Analyze eye positions relative to face
        face_center_x = w // 2
        eye_positions = []
        for (ex, ey, ew, eh) in eyes[:2]:
            eye_center_x = ex + ew // 2
            eye_positions.append(eye_center_x)

        # Check if eyes are roughly centered in the face (looking at screen)
        avg_eye_x = sum(eye_positions) / len(eye_positions)
        deviation = abs(avg_eye_x - face_center_x) / face_center_x

        looking_away = deviation > 0.3  # 30% deviation threshold
        direction = 'center'
        if avg_eye_x < face_center_x * 0.7:
            direction = 'left'
        elif avg_eye_x > face_center_x * 1.3:
            direction = 'right'

        return {
            'looking_away': looking_away,
            'direction': direction,
            'deviation': round(deviation, 3),
            'confidence': min(deviation * 2, 1.0) if looking_away else 1.0 - deviation,
        }
