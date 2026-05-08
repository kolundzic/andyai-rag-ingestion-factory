from __future__ import annotations

from dataclasses import dataclass
from typing import Any


@dataclass(frozen=True)
class StoredDocument:
    document_id: str
    file_name: str
    file_hash: str
    source_path: str
    status: str


@dataclass(frozen=True)
class StoredIngestionRun:
    run_id: str
    document_id: str
    pipeline_version: str
    parser_name: str
    chunker_name: str
    pages_count: int
    chunks_count: int
    status: str


@dataclass(frozen=True)
class StoredChunk:
    chunk_id: str
    document_id: str
    file_name: str
    page_start: int
    page_end: int
    section_title: str
    chunk_index: int
    text_hash: str
    text: str


@dataclass(frozen=True)
class StoredCitationEvent:
    citation_event_id: str
    chunk_id: str
    document_id: str
    file_name: str
    page_start: int
    page_end: int
    section_title: str
    retrieval_method: str
    score: float


def manifest_to_ingestion_run(manifest: dict[str, Any]) -> StoredIngestionRun:
    return StoredIngestionRun(
        run_id=manifest["run_id"],
        document_id=manifest["document_id"],
        pipeline_version=manifest["pipeline_version"],
        parser_name=manifest["parser_name"],
        chunker_name=manifest["chunker_name"],
        pages_count=int(manifest["pages_count"]),
        chunks_count=int(manifest["chunks_count"]),
        status=manifest["status"],
    )
