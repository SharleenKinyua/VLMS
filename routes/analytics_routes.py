from flask import Blueprint, request, jsonify, render_template
from flask_jwt_extended import jwt_required
from database.models import (
    db, User, Course, Enrollment, Exam, Submission,
    Violation, UserAnalytics, Answer, Question, LearningProgress
)
from utils.security import role_required, get_identity
from sqlalchemy import func
from datetime import datetime, timedelta

analytics_bp = Blueprint('analytics', __name__)


# ──────────────── PAGE ROUTES ────────────────

@analytics_bp.route('/analytics')
@jwt_required()
@role_required('student', 'lecturer', 'admin')
def analytics_page():
    return render_template('analytics.html')


# ──────────────── STUDENT ANALYTICS ────────────────

@analytics_bp.route('/api/analytics/student/overview', methods=['GET'])
@jwt_required()
@role_required('student')
def student_overview():
    identity = get_identity()
    student_id = identity['id']

    enrollments = Enrollment.query.filter_by(student_id=student_id, status='active').count()
    submissions = Submission.query.filter_by(student_id=student_id).all()

    total_exams = len(submissions)
    avg_score = 0
    if submissions:
        scored = [s.total_score for s in submissions if s.total_score is not None]
        avg_score = sum(scored) / len(scored) if scored else 0

    flagged_count = sum(1 for s in submissions if s.is_flagged)

    return jsonify({
        'enrolled_courses': enrollments,
        'total_exams_taken': total_exams,
        'average_score': round(avg_score, 2),
        'flagged_exams': flagged_count,
    })


# ──────────────── COURSE ANALYTICS (Lecturer) ────────────────

@analytics_bp.route('/api/analytics/course/<int:course_id>', methods=['GET'])
@jwt_required()
@role_required('lecturer', 'admin')
def course_analytics(course_id):
    identity = get_identity()

    if identity['role'] == 'lecturer':
        course = Course.query.filter_by(id=course_id, lecturer_id=identity['id']).first()
        if not course:
            return jsonify({'error': 'Course not found'}), 404

    total_students = Enrollment.query.filter_by(course_id=course_id, status='active').count()

    # Exam performance
    exams = Exam.query.filter_by(course_id=course_id).all()
    exam_stats = []
    for exam in exams:
        subs = Submission.query.filter_by(exam_id=exam.id, status='graded').all()
        scores = [s.total_score for s in subs if s.total_score is not None]
        exam_stats.append({
            'exam_id': exam.id,
            'exam_title': exam.title,
            'total_submissions': len(subs),
            'average_score': round(sum(scores) / len(scores), 2) if scores else 0,
            'highest_score': max(scores) if scores else 0,
            'lowest_score': min(scores) if scores else 0,
            'pass_rate': round(
                sum(1 for s in scores if s >= (exam.passing_marks or 50)) / len(scores) * 100, 1
            ) if scores else 0,
        })

    return jsonify({
        'course_id': course_id,
        'total_students': total_students,
        'exam_stats': exam_stats,
    })


# ──────────────── MALPRACTICE REPORT ────────────────

@analytics_bp.route('/api/analytics/malpractice/<int:exam_id>', methods=['GET'])
@jwt_required()
@role_required('lecturer', 'admin')
def malpractice_report(exam_id):
    identity = get_identity()

    exam = Exam.query.get(exam_id)
    if not exam:
        return jsonify({'error': 'Exam not found'}), 404

    if identity['role'] == 'lecturer':
        course = Course.query.filter_by(id=exam.course_id, lecturer_id=identity['id']).first()
        if not course:
            return jsonify({'error': 'Unauthorized'}), 403

    flagged_submissions = Submission.query.filter_by(exam_id=exam_id, is_flagged=True).all()

    report = []
    for sub in flagged_submissions:
        student = User.query.get(sub.student_id)
        violations = Violation.query.filter_by(submission_id=sub.id).all()

        # Group violations by type
        violation_summary = {}
        for v in violations:
            vtype = v.violation_type
            if vtype not in violation_summary:
                violation_summary[vtype] = {'count': 0, 'total_severity': 0}
            violation_summary[vtype]['count'] += 1
            violation_summary[vtype]['total_severity'] += v.severity

        report.append({
            'student_id': sub.student_id,
            'student_name': f"{student.first_name} {student.last_name}" if student else 'Unknown',
            'risk_score': sub.risk_score,
            'total_violations': len(violations),
            'violation_summary': violation_summary,
            'screenshots': [v.screenshot_path for v in violations if v.screenshot_path],
        })

    return jsonify({
        'exam_id': exam_id,
        'exam_title': exam.title,
        'total_flagged': len(flagged_submissions),
        'reports': report,
    })


# ──────────────── ENGAGEMENT ANALYTICS ────────────────

@analytics_bp.route('/api/analytics/engagement/<int:course_id>', methods=['GET'])
@jwt_required()
@role_required('lecturer', 'admin')
def engagement_analytics(course_id):
    identity = get_identity()

    if identity['role'] == 'lecturer':
        course = Course.query.filter_by(id=course_id, lecturer_id=identity['id']).first()
        if not course:
            return jsonify({'error': 'Course not found'}), 404

    # Material engagement
    progress_records = db.session.query(
        LearningProgress.material_id,
        func.count(LearningProgress.id).label('views'),
        func.avg(LearningProgress.progress_percent).label('avg_progress'),
        func.sum(LearningProgress.time_spent_seconds).label('total_time'),
    ).join(
        LearningProgress.material_id == LearningProgress.material_id
    ).filter(
        LearningProgress.material_id.in_(
            db.session.query(func.distinct(LearningProgress.material_id))
        )
    ).group_by(LearningProgress.material_id).all()

    engagement = []
    for record in progress_records:
        engagement.append({
            'material_id': record.material_id,
            'total_views': record.views,
            'avg_progress': round(float(record.avg_progress or 0), 1),
            'total_time_hours': round((record.total_time or 0) / 3600, 1),
        })

    return jsonify({'course_id': course_id, 'engagement': engagement})


# ──────────────── PERFORMANCE PREDICTION ────────────────

@analytics_bp.route('/api/analytics/predict/<int:student_id>/<int:course_id>', methods=['GET'])
@jwt_required()
@role_required('lecturer', 'admin')
def predict_performance(student_id, course_id):
    """Simple performance prediction based on historical data."""
    submissions = Submission.query.filter_by(student_id=student_id, status='graded').all()
    course_exams = Exam.query.filter_by(course_id=course_id).all()
    course_exam_ids = [e.id for e in course_exams]

    course_submissions = [s for s in submissions if s.exam_id in course_exam_ids]
    scores = [s.total_score for s in course_submissions if s.total_score is not None]

    if len(scores) < 2:
        return jsonify({'prediction': None, 'message': 'Not enough data for prediction'})

    # Simple trend-based prediction
    avg_score = sum(scores) / len(scores)
    recent_avg = sum(scores[-3:]) / len(scores[-3:])  # Last 3 exams

    trend = 'improving' if recent_avg > avg_score else 'declining' if recent_avg < avg_score else 'stable'
    predicted_score = round(recent_avg * 1.05 if trend == 'improving' else recent_avg * 0.95, 1)

    return jsonify({
        'student_id': student_id,
        'course_id': course_id,
        'average_score': round(avg_score, 2),
        'recent_average': round(recent_avg, 2),
        'trend': trend,
        'predicted_next_score': predicted_score,
        'risk_level': 'high' if predicted_score < 40 else 'medium' if predicted_score < 60 else 'low',
    })


# ──────────────── ADMIN DASHBOARD STATS ────────────────

@analytics_bp.route('/api/analytics/admin/overview', methods=['GET'])
@jwt_required()
@role_required('admin')
def admin_overview():
    total_users = User.query.count()
    total_students = User.query.filter_by(role='student').count()
    total_lecturers = User.query.filter_by(role='lecturer').count()
    total_courses = Course.query.count()
    total_exams = Exam.query.count()
    total_submissions = Submission.query.count()
    flagged_submissions = Submission.query.filter_by(is_flagged=True).count()

    return jsonify({
        'total_users': total_users,
        'total_students': total_students,
        'total_lecturers': total_lecturers,
        'total_courses': total_courses,
        'total_exams': total_exams,
        'total_submissions': total_submissions,
        'flagged_submissions': flagged_submissions,
    })
