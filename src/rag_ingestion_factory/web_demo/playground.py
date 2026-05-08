from __future__ import annotations

from rag_ingestion_factory.evidence.pack import build_evidence_pack
from rag_ingestion_factory.retrieval.models import RetrievalCandidate


def build_playground_demo_response(query: str) -> dict:
    candidate = RetrievalCandidate(
        chunk_id="demo_chunk_001",
        document_id="demo_document",
        file_name="demo_document.txt",
        page_start=1,
        page_end=1,
        section_title="Demo",
        text="The ingestion pipeline prepares documents for chunking, indexing, retrieval, and evidence-backed answers.",
        score=0.98,
        retrieval_method="demo-hybrid",
    )
    pack = build_evidence_pack(query, [candidate], limit=1)
    return {
        "mode": "public-playground-demo",
        "query": query,
        "evidence_pack": pack,
        "public_rule": "No citation, no trusted answer.",
    }
