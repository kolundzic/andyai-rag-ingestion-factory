from __future__ import annotations

from pathlib import Path
from typing import Any

try:
    from fastapi import FastAPI
    from pydantic import BaseModel
except Exception:  # pragma: no cover
    FastAPI = None
    BaseModel = object  # type: ignore

from rag_ingestion_factory.core.pipeline_v1 import ingest_local_file
from rag_ingestion_factory.core.registry import register_document
from rag_ingestion_factory.adapters.router import parse_document
from rag_ingestion_factory.core.chunker import chunk_page_blocks
from rag_ingestion_factory.indexes.deterministic_embeddings import embed_text
from rag_ingestion_factory.indexes.memory_vector_index import MemoryVectorIndex
from rag_ingestion_factory.retrieval.hybrid import HybridRetriever
from rag_ingestion_factory.evidence.pack import build_evidence_pack
from rag_ingestion_factory.operator.console import run_operator_console_demo


if FastAPI is None:
    app = None
else:
    app = FastAPI(title="AndyAI RAG Ingestion Factory", version="3.0.0")


class IngestTextDemoRequest(BaseModel):  # type: ignore[misc]
    input_path: str
    output_dir: str = "examples/output/api_ingest"


class RetrieveDemoRequest(BaseModel):  # type: ignore[misc]
    input_path: str
    query: str
    limit: int = 3


class OperatorDemoRequest(BaseModel):  # type: ignore[misc]
    input_path: str
    query: str
    output_dir: str = "examples/output/operator_console_api"


if app is not None:
    @app.get("/health")
    def health() -> dict[str, str]:
        return {"status": "ok", "service": "andyai-rag-ingestion-factory", "version": "3.0.0"}

    @app.post("/ingest/text-demo")
    def ingest_text_demo(request: IngestTextDemoRequest) -> dict[str, Any]:
        return ingest_local_file(request.input_path, request.output_dir)

    @app.post("/retrieve/demo")
    def retrieve_demo(request: RetrieveDemoRequest) -> dict[str, Any]:
        document = register_document(Path(request.input_path))
        pages = parse_document(document)
        chunks = chunk_page_blocks(pages)

        idx = MemoryVectorIndex()
        for chunk in chunks:
            idx.upsert_chunk(chunk, embed_text(chunk.text))

        results = HybridRetriever(chunks, idx).search(request.query, limit=request.limit)
        return build_evidence_pack(request.query, results, limit=request.limit)

    @app.post("/operator/demo")
    def operator_demo(request: OperatorDemoRequest) -> dict[str, Any]:
        return run_operator_console_demo(request.input_path, request.query, request.output_dir)
