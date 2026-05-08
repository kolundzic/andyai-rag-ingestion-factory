from pathlib import Path

from rag_ingestion_factory.core.pipeline_v1 import ingest_local_file
from rag_ingestion_factory.core.registry import register_document
from rag_ingestion_factory.adapters.router import parse_document
from rag_ingestion_factory.core.chunker import chunk_page_blocks
from rag_ingestion_factory.core.citations import citation_from_chunk
from rag_ingestion_factory.db.memory_repository import InMemoryMetadataRepository


def test_in_memory_metadata_repository(tmp_path: Path):
    source = tmp_path / "demo.txt"
    source.write_text("Page 1\nMetadata layer test.", encoding="utf-8")

    out = tmp_path / "out"
    manifest = ingest_local_file(source, out)

    document = register_document(source)
    pages = parse_document(document)
    chunks = chunk_page_blocks(pages)
    citations = [citation_from_chunk(chunk) for chunk in chunks]

    repo = InMemoryMetadataRepository()
    repo.save_document(document)
    repo.save_ingestion_run(manifest)
    repo.save_chunks(chunks)
    repo.save_citation_events(citations)

    summary = repo.summary()

    assert summary["documents"] == 1
    assert summary["ingestion_runs"] == 1
    assert summary["chunks"] >= 1
    assert summary["citation_events"] >= 1
