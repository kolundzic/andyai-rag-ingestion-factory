from __future__ import annotations
from rag_ingestion_factory.evidence.reranker import rerank_candidates
from rag_ingestion_factory.retrieval.models import RetrievalCandidate

def build_evidence_pack(query: str, candidates: list[RetrievalCandidate], limit: int = 5) -> dict:
    ranked = rerank_candidates(query, candidates, limit=limit)
    citations = [
        {
            "chunk_id": c.chunk_id,
            "document_id": c.document_id,
            "file_name": c.file_name,
            "page_start": c.page_start,
            "page_end": c.page_end,
            "section_title": c.section_title,
            "retrieval_method": c.retrieval_method,
            "score": round(float(c.score), 4),
        }
        for c in ranked
    ]
    answer_context = "\n\n".join(
        [f"[{i+1}] {c.file_name} pp.{c.page_start}-{c.page_end} | {c.section_title}\n{c.text}" for i, c in enumerate(ranked)]
    )
    return {
        "query": query,
        "candidate_count": len(candidates),
        "selected_count": len(ranked),
        "evidence_policy": "No citation pack, no trusted answer.",
        "answer_context": answer_context,
        "citations": citations,
    }
