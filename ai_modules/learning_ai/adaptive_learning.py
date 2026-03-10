"""
Adaptive Learning Module
Tracks student performance patterns and recommends personalized learning paths.
"""
from database.models import db, LearningProgress, Submission, Answer, Question, Enrollment


class AdaptiveLearningEngine:
    """Provides adaptive learning recommendations based on student performance."""

    def get_recommendations(self, student_id, course_id):
        """
        Analyze student performance and return learning recommendations.
        """
        # Get exam performance data
        submissions = Submission.query.filter_by(student_id=student_id).all()
        weak_areas = self._identify_weak_areas(student_id, course_id)
        study_pattern = self._analyze_study_pattern(student_id, course_id)

        recommendations = []

        # Weak topic recommendations
        for area in weak_areas:
            recommendations.append({
                'type': 'review',
                'priority': 'high' if area['accuracy'] < 0.4 else 'medium',
                'message': f"Review: {area['topic']} — accuracy {area['accuracy']*100:.0f}%",
                'difficulty': area['difficulty'],
            })

        # Study habit recommendations
        if study_pattern.get('total_time_hours', 0) < 2:
            recommendations.append({
                'type': 'engagement',
                'priority': 'high',
                'message': 'Increase study time. Aim for at least 2 hours per week.',
            })

        if study_pattern.get('incomplete_materials', 0) > 3:
            recommendations.append({
                'type': 'completion',
                'priority': 'medium',
                'message': f"Complete {study_pattern['incomplete_materials']} unfinished materials.",
            })

        return {
            'student_id': student_id,
            'course_id': course_id,
            'weak_areas': weak_areas,
            'study_pattern': study_pattern,
            'recommendations': recommendations,
        }

    def _identify_weak_areas(self, student_id, course_id):
        """Identify topics where the student performs poorly."""
        from database.models import Exam

        exams = Exam.query.filter_by(course_id=course_id).all()
        exam_ids = [e.id for e in exams]

        submissions = Submission.query.filter_by(student_id=student_id).filter(
            Submission.exam_id.in_(exam_ids)
        ).all()

        # Aggregate performance by difficulty level
        difficulty_scores = {}
        for sub in submissions:
            answers = Answer.query.filter_by(submission_id=sub.id).all()
            for ans in answers:
                q = Question.query.get(ans.question_id)
                if not q:
                    continue
                diff = q.difficulty or 'understand'
                if diff not in difficulty_scores:
                    difficulty_scores[diff] = {'correct': 0, 'total': 0}
                difficulty_scores[diff]['total'] += 1
                if ans.is_correct:
                    difficulty_scores[diff]['correct'] += 1

        weak_areas = []
        for diff, stats in difficulty_scores.items():
            accuracy = stats['correct'] / stats['total'] if stats['total'] > 0 else 0
            if accuracy < 0.7:  # Below 70% is considered weak
                weak_areas.append({
                    'topic': f"Bloom's Level: {diff.title()}",
                    'difficulty': diff,
                    'accuracy': round(accuracy, 2),
                    'questions_attempted': stats['total'],
                })

        return sorted(weak_areas, key=lambda x: x['accuracy'])

    def _analyze_study_pattern(self, student_id, course_id):
        """Analyze the student's study habits."""
        progress = LearningProgress.query.filter_by(student_id=student_id).all()

        total_time = sum(p.time_spent_seconds for p in progress)
        completed = sum(1 for p in progress if p.completed)
        incomplete = sum(1 for p in progress if not p.completed and p.progress_percent > 0)

        return {
            'total_time_hours': round(total_time / 3600, 1),
            'materials_completed': completed,
            'incomplete_materials': incomplete,
            'avg_progress': round(
                sum(p.progress_percent for p in progress) / len(progress), 1
            ) if progress else 0,
        }
