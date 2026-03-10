"""
Flashcard Generator Module
Automatically generates flashcards from lecture notes using NLP.
Extracts key terms and definitions to create Q&A pairs.
"""
import re
from collections import Counter


class FlashcardGenerator:
    """Generate flashcards from text content."""

    def generate(self, text, max_cards=15):
        """
        Generate flashcards from text.
        Returns list of dicts with 'front' (question) and 'back' (answer).
        """
        if not text or len(text.strip()) < 50:
            return []

        cards = []

        # Strategy 1: Extract definition-style sentences
        cards.extend(self._extract_definitions(text))

        # Strategy 2: Extract key term explanations
        cards.extend(self._extract_key_terms(text))

        # Strategy 3: Convert topic sentences to questions
        cards.extend(self._convert_to_questions(text))

        # Deduplicate and limit
        seen = set()
        unique_cards = []
        for card in cards:
            key = card['front'].lower().strip()
            if key not in seen:
                seen.add(key)
                unique_cards.append(card)

        return unique_cards[:max_cards]

    def _extract_definitions(self, text):
        """Extract sentences that look like definitions."""
        cards = []
        # Patterns: "X is defined as Y", "X refers to Y", "X is a Y"
        patterns = [
            r'([A-Z][^.]*?)\s+(?:is defined as|is the|refers to|means|is a|is an)\s+([^.]+\.)',
            r'([A-Z][^.]*?)\s*[-:]\s*([^.]+\.)',
        ]

        for pattern in patterns:
            matches = re.findall(pattern, text)
            for term, definition in matches:
                term = term.strip()
                definition = definition.strip()
                if 10 < len(definition) < 300 and len(term) < 100:
                    cards.append({
                        'front': f'What is {term}?',
                        'back': definition,
                    })

        return cards

    def _extract_key_terms(self, text):
        """Extract important terms and their surrounding context."""
        cards = []
        sentences = re.split(r'(?<=[.!?])\s+', text)

        # Find capitalized terms or bold/emphasized terms
        for sentence in sentences:
            # Look for quoted or parenthesized terms
            quoted = re.findall(r'"([^"]+)"|\'([^\']+)\'|\(([^)]+)\)', sentence)
            for groups in quoted:
                term = next((g for g in groups if g), '')
                if 3 < len(term) < 50:
                    cards.append({
                        'front': f'Explain: {term}',
                        'back': sentence.strip(),
                    })

        return cards

    def _convert_to_questions(self, text):
        """Convert informative sentences into questions."""
        cards = []
        sentences = re.split(r'(?<=[.!?])\s+', text)

        for sentence in sentences:
            sentence = sentence.strip()
            if len(sentence.split()) < 8 or len(sentence.split()) > 30:
                continue

            # Convert "X does Y" into "What does X do?"
            if re.match(r'^[A-Z]', sentence):
                words = sentence.split()
                if len(words) > 5:
                    # Create a fill-in-the-blank card
                    mid = len(words) // 2
                    blank_words = words[mid:mid+3]
                    question = ' '.join(words[:mid]) + ' _____ ' + ' '.join(words[mid+3:])
                    answer = ' '.join(blank_words)

                    if len(answer) > 3:
                        cards.append({
                            'front': f'Fill in: {question}',
                            'back': f'{answer} — Full: {sentence}',
                        })

        return cards[:10]
