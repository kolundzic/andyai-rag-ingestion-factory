from __future__ import annotations
from rag_ingestion_factory.core.models import ChunkRecord
from rag_ingestion_factory.retrieval.models import RetrievalCandidate

def keyword_search(chunks: list[ChunkRecord], query: str, limit: int = 10) -> list[RetrievalCandidate]:
    terms = [t.lower() for t in query.split() if len(t) >= 3]
    results = []
    for chunk in chunks:
        text_l = chunk.text.lower()
        hits = sum(1 for term in terms if term in text_l)
        if hits <= 0:
            continue
        results.append(
            RetrievalCandidate(
                chunk_id=chunk.chunk_id,
                document_id=chunk.document_id,
                file_name=chunk.file_name,
                page_start=chunk.page_start,
                page_end=chunk.page_end,
                section_title=chunk.section_title,
                text=chunk.text,
                score=hits / max(len(terms), 1),
                retrieval_method="keyword",
            )
        )
    return sorted(results, key=lambda r: r.score, reverse=True)[:limit]
