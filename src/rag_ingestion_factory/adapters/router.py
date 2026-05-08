from __future__ import annotations

from pathlib import Path

from rag_ingestion_factory.adapters.text_parser import parse_text_file
from rag_ingestion_factory.adapters.pdf_parser import parse_pdf_file
from rag_ingestion_factory.core.models import DocumentRecord, PageBlock


def parse_document(document: DocumentRecord) -> list[PageBlock]:
    suffix = Path(document.source_path).suffix.lower()

    if suffix == ".txt":
        return parse_text_file(document)

    if suffix == ".pdf":
        return parse_pdf_file(document)

    raise ValueError(f"Unsupported input file type: {suffix}. Supported: .txt, .pdf")
