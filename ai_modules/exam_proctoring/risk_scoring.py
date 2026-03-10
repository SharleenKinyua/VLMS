"""
Risk Scoring Module
Aggregates all proctoring signals into a malpractice risk score.

Risk Point Reference:
  - Looking away too often:     +5 per event
  - Second face detected:       +40 per event
  - Phone detected:             +50 per event
  - Talking / lip movement:     +20 per event
  - Head pose suspicious:       +5 per event
  - Tab switch:                 +10 per event
  - No face detected:           +15 per event
  - Background person:          +40 per event
"""
import cv2
import numpy as np
import base64

from ai_modules.exam_proctoring.eye_tracking import EyeTracker
from ai_modules.exam_proctoring.head_pose import HeadPoseEstimator
from ai_modules.exam_proctoring.object_detection import ObjectDetector


class RiskScorer:
    # Severity points for each violation type
    SEVERITY_MAP = {
        'multiple_faces': 40,
        'no_face': 15,
        'eye_gaze': 5,
        'head_pose': 5,
        'lip_movement': 20,
        'phone_detected': 50,
        'tab_switch': 10,
        'background_person': 40,
    }

    def __init__(self):
        self.eye_tracker = EyeTracker()
        self.head_estimator = HeadPoseEstimator()
        self.object_detector = ObjectDetector()

    def _decode_image(self, base64_str):
        """Decode base64 image to OpenCV format."""
        if ',' in base64_str:
            base64_str = base64_str.split(',')[1]
        img_bytes = base64.b64decode(base64_str)
        np_arr = np.frombuffer(img_bytes, np.uint8)
        return cv2.imdecode(np_arr, cv2.IMREAD_COLOR)

    def analyze_frame(self, base64_image):
        """
        Analyze a single webcam frame and return list of violations detected.
        Each violation has: type, severity, description.
        """
        image = self._decode_image(base64_image)
        if image is None:
            return []

        violations = []

        # 1. Check for multiple faces / no face
        people_result = self.object_detector.detect_multiple_people(image)
        if people_result['no_face']:
            violations.append({
                'type': 'no_face',
                'severity': self.SEVERITY_MAP['no_face'],
                'description': 'No face detected in frame',
            })
        elif people_result['multiple_people']:
            violations.append({
                'type': 'multiple_faces',
                'severity': self.SEVERITY_MAP['multiple_faces'],
                'description': f"{people_result['face_count']} faces detected",
            })

        # 2. Eye gaze analysis (only if face is present)
        if not people_result['no_face']:
            gaze_result = self.eye_tracker.detect_eye_gaze(image)
            if gaze_result['looking_away']:
                violations.append({
                    'type': 'eye_gaze',
                    'severity': self.SEVERITY_MAP['eye_gaze'],
                    'description': f"Looking away: {gaze_result.get('direction', 'unknown')}",
                })

            # 3. Head pose
            pose_result = self.head_estimator.estimate_pose(image)
            if pose_result['suspicious']:
                violations.append({
                    'type': 'head_pose',
                    'severity': self.SEVERITY_MAP['head_pose'],
                    'description': f"Suspicious head pose: {pose_result.get('reason', '')}",
                })

        # 4. Phone detection
        phone_result = self.object_detector.detect_phone(image)
        if phone_result['phone_detected']:
            violations.append({
                'type': 'phone_detected',
                'severity': self.SEVERITY_MAP['phone_detected'],
                'description': 'Mobile phone detected in frame',
            })

        # 5. Background person
        bg_result = self.object_detector.detect_background_person(image)
        if bg_result['background_person']:
            violations.append({
                'type': 'background_person',
                'severity': self.SEVERITY_MAP['background_person'],
                'description': f"Background person detected",
            })

        return violations
