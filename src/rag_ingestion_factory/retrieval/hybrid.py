from __future__ import annotations
from rag_ingestion_factory.core.models import ChunkRecord
from rag_ingestion_factory.indexes.memory_vector_index import MemoryVectorIndex
from rag_ingestion_factory.retrieval.keyword import keyword_search
from rag_ingestion_factory.retrieval.models import RetrievalCandidate

class HybridRetriever:
    def __init__(self, chunks: list[ChunkRecord], vector_index: MemoryVectorIndex) -> None:
        self.chunks = chunks
        self.vector_index = vector_index
        self.chunk_by_id = {chunk.chunk_id: chunk for chunk in chunks}

    def search(self, query: str, limit: int = 5) -> list[RetrievalCandidate]:
        merged: dict[str, RetrievalCandidate] = {}
        for candidate in keyword_search(self.chunks, query, limit=limit * 2):
            merged[candidate.chunk_id] = candidate
        for vector_result in self.vector_index.search(query, limit=limit * 2):
            chunk = self.chunk_by_id.get(vector_result.chunk_id)
            if chunk is None:
                continue
            existing = merged.get(chunk.chunk_id)
            if existing:
                score = min(1.0, (existing.score * 0.55) + (vector_result.score * 0.45) + 0.15)
                method = "hybrid"
            else:
                score = vector_result.score
                method = "vector"
            merged[chunk.chunk_id] = RetrievalCandidate(
                chunk_id=chunk.chunk_id,
                document_id=chunk.document_id,
                file_name=chunk.file_name,
                page_start=chunk.page_start,
                page_end=chunk.page_end,
                section_title=chunk.section_title,
                text=chunk.text,
                score=score,
                retrieval_method=method,
            )
        return sorted(merged.values(), key=lambda r: r.score, reverse=True)[:limit]
