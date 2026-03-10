"""
Document Text Extraction
Extracts readable text from uploaded files (PDF, DOCX, TXT, PPTX).
"""

import os


def extract_text(file_path: str) -> str:
    """
    Extract text content from a file.  Supports PDF, DOCX, TXT, and PPTX.
    Returns empty string on failure — never raises.
    """
    if not os.path.isfile(file_path):
        return ""

    ext = file_path.rsplit(".", 1)[-1].lower() if "." in file_path else ""

    extractors = {
        "pdf": _extract_pdf,
        "txt": _extract_txt,
        "md": _extract_txt,
        "docx": _extract_docx,
        "pptx": _extract_pptx,
    }

    extractor = extractors.get(ext)
    if extractor is None:
        return ""

    try:
        return extractor(file_path)
    except Exception:
        return ""


# ─── individual extractors ───

def _extract_pdf(path: str) -> str:
    from PyPDF2 import PdfReader

    reader = PdfReader(path)
    pages = []
    for page in reader.pages:
        text = page.extract_text()
        if text:
            pages.append(text)
    return "\n\n".join(pages)


def _extract_txt(path: str) -> str:
    with open(path, "r", encoding="utf-8", errors="ignore") as f:
        return f.read()


def _extract_docx(path: str) -> str:
    import docx

    doc = docx.Document(path)
    return "\n".join(p.text for p in doc.paragraphs if p.text.strip())


def _extract_pptx(path: str) -> str:
    from pptx import Presentation

    prs = Presentation(path)
    text_parts = []
    for slide in prs.slides:
        for shape in slide.shapes:
            if shape.has_text_frame:
                text_parts.append(shape.text_frame.text)
    return "\n\n".join(text_parts)
