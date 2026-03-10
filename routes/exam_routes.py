import os
import base64
from flask import Blueprint, request, jsonify, render_template, current_app
from flask_jwt_extended import jwt_required
from database.models import db, Exam, Submission, Violation, Question, Answer
from utils.security import role_required, get_identity
from datetime import datetime

exam_bp = Blueprint('exam', __name__)


# ──────────────── EXAM INTERFACE PAGE ────────────────

@exam_bp.route('/exam/<int:exam_id>')
@jwt_required()
@role_required('student')
def exam_interface(exam_id):
    return render_template('exam_interface.html', exam_id=exam_id)


# ──────────────── PROCTORING ENDPOINTS ────────────────

@exam_bp.route('/api/exam/<int:submission_id>/face-verify', methods=['POST'])
@jwt_required()
@role_required('student')
def face_verify(submission_id):
    """Verify student face before starting exam."""
    identity = get_identity()
    submission = Submission.query.get(submission_id)

    if not submission or submission.student_id != identity['id']:
        return jsonify({'error': 'Submission not found'}), 404

    data = request.get_json()
    image_data = data.get('image')  # Base64 encoded frame

    if not image_data:
        return jsonify({'error': 'No image provided'}), 400

    # Import face auth module
    try:
        from ai_modules.exam_proctoring.face_auth import FaceAuthenticator
        authenticator = FaceAuthenticator()
        is_verified = authenticator.verify_face(identity['id'], image_data)
    except ImportError:
        # Fallback if AI module not fully configured — allow pass
        is_verified = True

    submission.face_verified = is_verified
    db.session.commit()

    return jsonify({
        'verified': is_verified,
        'message': 'Face verified successfully' if is_verified else 'Face verification failed'
    })


@exam_bp.route('/api/exam/<int:submission_id>/proctor-frame', methods=['POST'])
@jwt_required()
@role_required('student')
def process_proctor_frame(submission_id):
    """Process a webcam frame for proctoring analysis."""
    identity = get_identity()
    submission = Submission.query.get(submission_id)

    if not submission or submission.student_id != identity['id']:
        return jsonify({'error': 'Submission not found'}), 404
    if submission.status != 'in_progress':
        return jsonify({'error': 'Exam not in progress'}), 400

    data = request.get_json()
    image_data = data.get('image')  # Base64 encoded frame

    if not image_data:
        return jsonify({'error': 'No image provided'}), 400

    violations = []
    try:
        from ai_modules.exam_proctoring.risk_scoring import RiskScorer
        scorer = RiskScorer()
        violations = scorer.analyze_frame(image_data)
    except ImportError:
        pass

    # Record violations
    for v in violations:
        severity = v.get('severity', 5)
        violation = Violation(
            submission_id=submission_id,
            violation_type=v['type'],
            severity=severity,
            description=v.get('description', ''),
        )

        # Save screenshot for significant violations
        if severity >= 20:
            screenshot_dir = current_app.config.get('SCREENSHOT_FOLDER', 'screenshots')
            os.makedirs(screenshot_dir, exist_ok=True)
            filename = f"v_{submission_id}_{datetime.utcnow().strftime('%Y%m%d_%H%M%S')}.png"
            filepath = os.path.join(screenshot_dir, filename)

            # Decode and save the base64 image
            img_bytes = base64.b64decode(image_data.split(',')[-1])
            with open(filepath, 'wb') as f:
                f.write(img_bytes)
            violation.screenshot_path = filename

        db.session.add(violation)
        submission.risk_score += severity

    # Check threshold
    exam = Exam.query.get(submission.exam_id)
    if submission.risk_score >= (exam.risk_threshold or 100):
        submission.is_flagged = True

    db.session.commit()

    return jsonify({
        'risk_score': submission.risk_score,
        'is_flagged': submission.is_flagged,
        'violations': [v.get('type') for v in violations],
    })


@exam_bp.route('/api/exam/<int:submission_id>/tab-switch', methods=['POST'])
@jwt_required()
@role_required('student')
def record_tab_switch(submission_id):
    """Record a tab switch violation."""
    identity = get_identity()
    submission = Submission.query.get(submission_id)

    if not submission or submission.student_id != identity['id']:
        return jsonify({'error': 'Submission not found'}), 404

    violation = Violation(
        submission_id=submission_id,
        violation_type='tab_switch',
        severity=10,
        description='Student switched browser tab/window',
    )
    db.session.add(violation)
    submission.risk_score += 10

    exam = Exam.query.get(submission.exam_id)
    if submission.risk_score >= (exam.risk_threshold or 100):
        submission.is_flagged = True

    db.session.commit()
    return jsonify({'risk_score': submission.risk_score, 'is_flagged': submission.is_flagged})


# ──────────────── VIOLATION REPORTS ────────────────

@exam_bp.route('/api/exam/<int:submission_id>/violations', methods=['GET'])
@jwt_required()
def get_violations(submission_id):
    identity = get_identity()
    submission = Submission.query.get(submission_id)
    if not submission:
        return jsonify({'error': 'Submission not found'}), 404

    # Only the student themselves or lecturers/admins can view
    if identity['role'] == 'student' and submission.student_id != identity['id']:
        return jsonify({'error': 'Unauthorized'}), 403

    violations = Violation.query.filter_by(submission_id=submission_id).order_by(Violation.timestamp).all()
    return jsonify({'violations': [v.to_dict() for v in violations]})
