from __future__ import annotations

from pathlib import Path

from rag_ingestion_factory.core.models import DocumentRecord, PageBlock


class PdfParserDependencyError(RuntimeError):
    """Raised when the optional PDF parser dependency is missing."""


def parse_pdf_file(document: DocumentRecord) -> list[PageBlock]:
    """
    Parse a PDF into page-level PageBlock records.

    This adapter uses PyMuPDF when available.

    Install with:
        python3 -m pip install pymupdf
    """
    try:
        import fitz  # PyMuPDF
    except Exception as exc:
        raise PdfParserDependencyError(
            "PDF ingestion requires PyMuPDF. Install it with: python3 -m pip install pymupdf"
        ) from exc

    path = Path(document.source_path)
    pages: list[PageBlock] = []

    with fitz.open(path) as pdf:
        for page_index, page in enumerate(pdf, start=1):
            text = page.get_text("text") or ""
            text = text.strip()
            if not text:
                continue

            pages.append(
                PageBlock(
                    document_id=document.document_id,
                    file_name=document.file_name,
                    page_number=page_index,
                    text=text,
                    section_title=f"Page {page_index}",
                )
            )

    return pages
