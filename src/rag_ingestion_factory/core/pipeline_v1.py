from __future__ import annotations

from pathlib import Path

from rag_ingestion_factory.adapters.text_parser import parse_text_file
from rag_ingestion_factory.core.chunker import chunk_page_blocks
from rag_ingestion_factory.core.citations import citation_from_chunk
from rag_ingestion_factory.core.manifest import build_manifest
from rag_ingestion_factory.core.registry import register_document
from rag_ingestion_factory.indexes.simple_keyword import build_simple_keyword_index
from rag_ingestion_factory.storage.jsonl_store import write_json, write_jsonl


PIPELINE_VERSION = "1.1.1"


def ingest_local_file(input_path: str | Path, output_dir: str | Path) -> dict:
    output = Path(output_dir)
    output.mkdir(parents=True, exist_ok=True)

    document = register_document(input_path)

    pages = parse_text_file(document)
    chunks = chunk_page_blocks(pages)

    keyword_index = build_simple_keyword_index(chunks)
    citations = [citation_from_chunk(chunk) for chunk in chunks[:5]]

    chunks_count = write_jsonl(output / "chunks.jsonl", chunks)
    write_json(output / "keyword_index.json", keyword_index)
    write_jsonl(output / "sample_citations.jsonl", citations)

    manifest = build_manifest(
        document=document,
        pipeline_version=PIPELINE_VERSION,
        parser_name="text_parser_v1",
        chunker_name="page_aware_chunker_v1",
        pages_count=len(pages),
        chunks_count=chunks_count,
        output_dir=output,
    )
    write_json(output / "manifest.json", manifest)

    return manifest
