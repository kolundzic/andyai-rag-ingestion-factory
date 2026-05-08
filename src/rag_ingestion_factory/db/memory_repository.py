from __future__ import annotations

from dataclasses import asdict
from typing import Iterable

from rag_ingestion_factory.core.models import ChunkRecord, CitationRecord, DocumentRecord
from rag_ingestion_factory.db.metadata_models import StoredIngestionRun, manifest_to_ingestion_run


class InMemoryMetadataRepository:
    """
    Deterministic metadata repository used for local tests and interface design.

    Production adapters can later implement the same methods using PostgreSQL.
    """

    def __init__(self) -> None:
        self.documents: dict[str, dict] = {}
        self.ingestion_runs: dict[str, dict] = {}
        self.chunks: dict[str, dict] = {}
        self.citation_events: dict[str, dict] = {}

    def save_document(self, document: DocumentRecord) -> None:
        self.documents[document.document_id] = asdict(document)

    def save_ingestion_run(self, manifest: dict) -> StoredIngestionRun:
        run = manifest_to_ingestion_run(manifest)
        self.ingestion_runs[run.run_id] = asdict(run)
        return run

    def save_chunks(self, chunks: Iterable[ChunkRecord]) -> int:
        count = 0
        for chunk in chunks:
            self.chunks[chunk.chunk_id] = asdict(chunk)
            count += 1
        return count

    def save_citation_events(self, citations: Iterable[CitationRecord]) -> int:
        count = 0
        for citation in citations:
            citation_event_id = f"cite_{citation.chunk_id}_{count}"
            payload = asdict(citation)
            payload["citation_event_id"] = citation_event_id
            self.citation_events[citation_event_id] = payload
            count += 1
        return count

    def summary(self) -> dict[str, int]:
        return {
            "documents": len(self.documents),
            "ingestion_runs": len(self.ingestion_runs),
            "chunks": len(self.chunks),
            "citation_events": len(self.citation_events),
        }
