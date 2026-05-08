from __future__ import annotations

from datetime import datetime, timezone
from pathlib import Path
from typing import Any

from rag_ingestion_factory.core.models import DocumentRecord


def build_manifest(
    document: DocumentRecord,
    pipeline_version: str,
    parser_name: str,
    chunker_name: str,
    pages_count: int,
    chunks_count: int,
    output_dir: str | Path,
    status: str = "completed",
    errors: list[str] | None = None,
) -> dict[str, Any]:
    now = datetime.now(timezone.utc).isoformat()
    return {
        "run_id": f"run_{document.document_id}_{pipeline_version.replace('.', '_')}",
        "pipeline_version": pipeline_version,
        "document_id": document.document_id,
        "file_name": document.file_name,
        "file_hash": document.file_hash,
        "source_path": document.source_path,
        "started_at": now,
        "finished_at": now,
        "status": status,
        "parser_name": parser_name,
        "chunker_name": chunker_name,
        "pages_count": pages_count,
        "chunks_count": chunks_count,
        "errors": errors or [],
        "outputs": {
            "output_dir": str(Path(output_dir).resolve()),
            "chunks": str(Path(output_dir).resolve() / "chunks.jsonl"),
            "keyword_index": str(Path(output_dir).resolve() / "keyword_index.json"),
            "manifest": str(Path(output_dir).resolve() / "manifest.json"),
        },
    }
