"""
Text Summarizer Module
Generates concise summaries from lecture notes and documents.
Uses extractive summarization with TF-IDF for lightweight operation.
For better results, integrate Hugging Face transformers summarization pipeline.
"""
import re
import math
from collections import Counter


class TextSummarizer:
    """Extractive text summarizer using TF-IDF scoring."""

    def summarize(self, text, num_sentences=5):
        """
        Generate an extractive summary by selecting top-scored sentences.
        """
        if not text or len(text.strip()) < 50:
            return text

        sentences = self._split_sentences(text)
        if len(sentences) <= num_sentences:
            return text

        # Calculate TF-IDF scores for sentences
        scores = self._score_sentences(sentences)

        # Select top sentences, preserving original order
        ranked = sorted(range(len(scores)), key=lambda i: scores[i], reverse=True)
        selected = sorted(ranked[:num_sentences])

        summary = ' '.join(sentences[i] for i in selected)
        return summary

    def generate_key_points(self, text, num_points=7):
        """Extract key points from text."""
        sentences = self._split_sentences(text)
        if len(sentences) <= num_points:
            return [s.strip() for s in sentences]

        scores = self._score_sentences(sentences)
        ranked = sorted(range(len(scores)), key=lambda i: scores[i], reverse=True)
        return [sentences[i].strip() for i in ranked[:num_points]]

    def _split_sentences(self, text):
        """Split text into sentences."""
        sentences = re.split(r'(?<=[.!?])\s+', text.strip())
        return [s for s in sentences if len(s.split()) > 3]

    def _score_sentences(self, sentences):
        """Score each sentence using TF-IDF."""
        # Tokenize
        words_per_sentence = [self._tokenize(s) for s in sentences]
        all_words = [w for words in words_per_sentence for w in words]

        # Term frequency
        total_tf = Counter(all_words)

        # Document frequency (how many sentences contain the word)
        df = Counter()
        for words in words_per_sentence:
            for word in set(words):
                df[word] += 1

        n = len(sentences)
        scores = []
        for words in words_per_sentence:
            score = 0
            for word in words:
                tf = words.count(word) / len(words) if words else 0
                idf = math.log((n + 1) / (df[word] + 1)) + 1
                score += tf * idf
            # Normalize by sentence length
            score = score / (len(words) + 1)
            scores.append(score)

        return scores

    @staticmethod
    def _tokenize(text):
        """Simple tokenizer: lowercase, remove punctuation, filter stopwords."""
        stopwords = {
            'the', 'a', 'an', 'is', 'are', 'was', 'were', 'be', 'been', 'being',
            'have', 'has', 'had', 'do', 'does', 'did', 'will', 'would', 'could',
            'should', 'may', 'might', 'shall', 'can', 'to', 'of', 'in', 'for',
            'on', 'with', 'at', 'by', 'from', 'as', 'into', 'through', 'during',
            'before', 'after', 'above', 'below', 'between', 'and', 'but', 'or',
            'nor', 'not', 'so', 'yet', 'both', 'either', 'neither', 'each',
            'every', 'all', 'any', 'few', 'more', 'most', 'other', 'some',
            'such', 'no', 'only', 'own', 'same', 'than', 'too', 'very',
            'just', 'because', 'if', 'when', 'while', 'this', 'that', 'these',
            'those', 'it', 'its', 'he', 'she', 'they', 'them', 'their',
            'his', 'her', 'my', 'your', 'our', 'we', 'you', 'i', 'me',
        }
        words = re.findall(r'\b[a-z]+\b', text.lower())
        return [w for w in words if w not in stopwords and len(w) > 2]
