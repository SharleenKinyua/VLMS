"""
Head Pose Estimation Module
Estimates head orientation using facial landmark positions.
Uses OpenCV's face detection and geometric analysis.
"""
import cv2
import numpy as np


class HeadPoseEstimator:
    def __init__(self):
        self.face_cascade = cv2.CascadeClassifier(
            cv2.data.haarcascades + 'haarcascade_frontalface_default.xml'
        )

    def estimate_pose(self, image):
        """
        Estimate head pose from image.
        Returns dict with pose angles and whether suspicious.
        """
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        faces = self.face_cascade.detectMultiScale(gray, 1.1, 5, minSize=(80, 80))

        if len(faces) == 0:
            return {
                'suspicious': True,
                'reason': 'no_face',
                'yaw': None,
                'pitch': None,
            }

        x, y, w, h = faces[0]
        img_h, img_w = image.shape[:2]

        # Estimate yaw (left-right) based on face position relative to frame center
        face_center_x = x + w // 2
        face_center_y = y + h // 2

        # Deviation from center (normalized)
        x_dev = (face_center_x - img_w // 2) / (img_w // 2)
        y_dev = (face_center_y - img_h // 2) / (img_h // 2)

        # Estimate aspect ratio change for pitch/yaw
        aspect = w / h
        # Normal face aspect ratio is ~0.7-0.85
        yaw_estimate = x_dev * 45  # Map to approximate degrees
        pitch_estimate = y_dev * 30

        # Check face size relative to frame (too small = too far / turned away)
        face_area_ratio = (w * h) / (img_w * img_h)

        suspicious = (
            abs(yaw_estimate) > 25 or
            abs(pitch_estimate) > 20 or
            face_area_ratio < 0.02  # Face too small
        )

        return {
            'suspicious': suspicious,
            'yaw': round(yaw_estimate, 1),
            'pitch': round(pitch_estimate, 1),
            'face_size_ratio': round(face_area_ratio, 4),
            'reason': self._get_reason(yaw_estimate, pitch_estimate, face_area_ratio),
        }

    @staticmethod
    def _get_reason(yaw, pitch, size_ratio):
        reasons = []
        if abs(yaw) > 25:
            direction = 'left' if yaw < 0 else 'right'
            reasons.append(f'head_turned_{direction}')
        if abs(pitch) > 20:
            direction = 'down' if pitch > 0 else 'up'
            reasons.append(f'head_tilted_{direction}')
        if size_ratio < 0.02:
            reasons.append('face_too_far')
        return ', '.join(reasons) if reasons else 'normal'
