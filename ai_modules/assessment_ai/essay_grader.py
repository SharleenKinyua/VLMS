"""
Essay Grader Module
Uses NLP similarity techniques to grade short answers and provide feedback.
For production, integrate with transformer-based models for semantic comparison.
"""
import re
import math
from collections import Counter


class EssayGrader:
    """Grade short answers and essays using NLP similarity."""

    def grade_short_answer(self, student_answer, correct_answer, max_marks):
        """
        Grade a short answer by comparing it to the expected answer.
        Returns (score, feedback).
        """
        if not student_answer or not student_answer.strip():
            return 0, 'No answer provided.'

        if not correct_answer:
            return 0, 'Cannot auto-grade: no reference answer available.'

        # Calculate similarity
        similarity = self._cosine_similarity(student_answer, correct_answer)

        # Convert similarity to score
        score = round(similarity * max_marks, 1)

        # Generate feedback
        feedback = self._generate_feedback(similarity, student_answer, correct_answer)

        return score, feedback

    def grade_essay(self, student_essay, rubric=None, max_marks=20):
        """
        Grade an essay based on multiple criteria.
        Returns (score, feedback_dict).
        """
        if not student_essay or not student_essay.strip():
            return 0, {'overall': 'No essay provided.'}

        word_count = len(student_essay.split())
        sentence_count = len(re.split(r'[.!?]+', student_essay))

        # Scoring criteria
        criteria = {}

        # Length assessment (20% of marks)
        length_score = min(1.0, word_count / 200)  # Expect at least 200 words
        criteria['length'] = {
            'score': round(length_score * max_marks * 0.2, 1),
            'feedback': f'Word count: {word_count}. ' + (
                'Good length.' if word_count >= 200 else 'Consider writing more.'
            ),
        }

        # Vocabulary richness (20% of marks)
        unique_words = len(set(student_essay.lower().split()))
        vocab_ratio = unique_words / word_count if word_count > 0 else 0
        vocab_score = min(1.0, vocab_ratio / 0.6)
        criteria['vocabulary'] = {
            'score': round(vocab_score * max_marks * 0.2, 1),
            'feedback': f'Vocabulary diversity: {vocab_ratio:.0%}. ' + (
                'Good variety.' if vocab_ratio > 0.5 else 'Try using more varied vocabulary.'
            ),
        }

        # Structure (20% of marks)
        has_paragraphs = '\n' in student_essay.strip()
        struct_score = 0.8 if has_paragraphs else 0.4
        criteria['structure'] = {
            'score': round(struct_score * max_marks * 0.2, 1),
            'feedback': 'Well structured.' if has_paragraphs else 'Consider using paragraphs.',
        }

        # Coherence: sentence length consistency (20% of marks)
        sent_lengths = [len(s.split()) for s in re.split(r'[.!?]+', student_essay) if s.strip()]
        avg_sent_len = sum(sent_lengths) / len(sent_lengths) if sent_lengths else 0
        coherence_score = 1.0 if 10 <= avg_sent_len <= 25 else 0.6
        criteria['coherence'] = {
            'score': round(coherence_score * max_marks * 0.2, 1),
            'feedback': f'Average sentence length: {avg_sent_len:.0f} words.',
        }

        # Relevance to rubric (20% of marks)
        if rubric:
            relevance = self._cosine_similarity(student_essay, rubric)
            criteria['relevance'] = {
                'score': round(relevance * max_marks * 0.2, 1),
                'feedback': f'Relevance to topic: {relevance:.0%}.',
            }
        else:
            criteria['relevance'] = {
                'score': round(max_marks * 0.15, 1),
                'feedback': 'No rubric available for relevance check.',
            }

        total_score = sum(c['score'] for c in criteria.values())
        return round(total_score, 1), criteria

    def _cosine_similarity(self, text1, text2):
        """Calculate cosine similarity between two texts using word vectors."""
        words1 = self._tokenize(text1)
        words2 = self._tokenize(text2)

        if not words1 or not words2:
            return 0.0

        counter1 = Counter(words1)
        counter2 = Counter(words2)

        all_words = set(counter1.keys()) | set(counter2.keys())

        dot_product = sum(counter1.get(w, 0) * counter2.get(w, 0) for w in all_words)
        magnitude1 = math.sqrt(sum(v ** 2 for v in counter1.values()))
        magnitude2 = math.sqrt(sum(v ** 2 for v in counter2.values()))

        if magnitude1 == 0 or magnitude2 == 0:
            return 0.0

        return dot_product / (magnitude1 * magnitude2)

    def _generate_feedback(self, similarity, student_answer, correct_answer):
        """Generate human-readable feedback based on similarity score."""
        if similarity > 0.8:
            return 'Excellent answer! Very close to the expected response.'
        elif similarity > 0.6:
            return 'Good answer. Covers most key points.'
        elif similarity > 0.4:
            return 'Partial answer. Some key concepts are missing.'
        elif similarity > 0.2:
            return 'Answer needs improvement. Review the relevant material.'
        else:
            return 'Answer does not match expected response. Please review the topic.'

    @staticmethod
    def _tokenize(text):
        """Tokenize and filter text."""
        stopwords = {
            'the', 'a', 'an', 'is', 'are', 'was', 'were', 'be', 'been',
            'have', 'has', 'had', 'do', 'does', 'did', 'will', 'would',
            'to', 'of', 'in', 'for', 'on', 'with', 'at', 'by', 'from',
            'as', 'and', 'but', 'or', 'not', 'this', 'that', 'it', 'its',
        }
        words = re.findall(r'\b[a-z]+\b', text.lower())
        return [w for w in words if w not in stopwords and len(w) > 2]
