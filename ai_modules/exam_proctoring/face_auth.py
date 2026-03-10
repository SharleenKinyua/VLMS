"""
Face Authentication Module
Uses OpenCV's Haar cascades for face detection and comparison.
For production, consider using dlib or face_recognition library.
"""
import cv2
import numpy as np
import base64
import pickle
from database.models import db, User


class FaceAuthenticator:
    def __init__(self):
        # Load OpenCV's pre-trained face detector
        self.face_cascade = cv2.CascadeClassifier(
            cv2.data.haarcascades + 'haarcascade_frontalface_default.xml'
        )

    def _decode_image(self, base64_str):
        """Decode a base64 image string to an OpenCV image."""
        # Handle data URI prefix
        if ',' in base64_str:
            base64_str = base64_str.split(',')[1]
        img_bytes = base64.b64decode(base64_str)
        np_arr = np.frombuffer(img_bytes, np.uint8)
        return cv2.imdecode(np_arr, cv2.IMREAD_COLOR)

    def detect_faces(self, image):
        """Detect faces in an image. Returns list of bounding boxes."""
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        faces = self.face_cascade.detectMultiScale(
            gray, scaleFactor=1.1, minNeighbors=5, minSize=(80, 80)
        )
        return faces

    def extract_face_encoding(self, image):
        """
        Extract a simple face encoding (histogram-based).
        For production use, replace with dlib or a deep learning model.
        """
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        faces = self.detect_faces(image)
        if len(faces) == 0:
            return None

        x, y, w, h = faces[0]
        face_roi = gray[y:y+h, x:x+w]
        face_roi = cv2.resize(face_roi, (128, 128))
        # Use Local Binary Pattern histogram as a simple encoding
        hist = cv2.calcHist([face_roi], [0], None, [256], [0, 256])
        cv2.normalize(hist, hist)
        return hist.flatten()

    def register_face(self, user_id, base64_image):
        """Register a user's face encoding for later authentication."""
        image = self._decode_image(base64_image)
        encoding = self.extract_face_encoding(image)
        if encoding is None:
            return False, 'No face detected in the image'

        user = User.query.get(user_id)
        if not user:
            return False, 'User not found'

        user.face_encoding = pickle.dumps(encoding)
        db.session.commit()
        return True, 'Face registered successfully'

    def verify_face(self, user_id, base64_image):
        """Verify if the face in the image matches the registered user."""
        user = User.query.get(user_id)
        if not user or not user.face_encoding:
            # If no face encoding stored, skip verification
            return True

        image = self._decode_image(base64_image)
        current_encoding = self.extract_face_encoding(image)
        if current_encoding is None:
            return False

        stored_encoding = pickle.loads(user.face_encoding)

        # Compare using correlation
        similarity = cv2.compareHist(
            stored_encoding.reshape(-1, 1).astype(np.float32),
            current_encoding.reshape(-1, 1).astype(np.float32),
            cv2.HISTCMP_CORREL
        )

        # Threshold for match (0.5 is relatively lenient)
        return similarity > 0.5
