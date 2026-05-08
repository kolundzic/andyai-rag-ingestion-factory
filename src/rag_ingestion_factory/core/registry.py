from __future__ import annotations

from pathlib import Path

from rag_ingestion_factory.core.hashing import file_sha256
from rag_ingestion_factory.core.models import DocumentRecord


def register_document(path: str | Path) -> DocumentRecord:
    p = Path(path).expanduser().resolve()
    if not p.exists():
        raise FileNotFoundError(f"Input file does not exist: {p}")

    digest = file_sha256(p)
    return DocumentRecord(
        document_id=f"doc_{digest[:16]}",
        file_name=p.name,
        file_hash=digest,
        source_path=str(p),
        status="registered",
    )
