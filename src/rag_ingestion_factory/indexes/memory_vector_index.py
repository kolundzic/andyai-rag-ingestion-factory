from __future__ import annotations
from dataclasses import asdict
from rag_ingestion_factory.core.models import ChunkRecord
from rag_ingestion_factory.indexes.deterministic_embeddings import cosine_similarity, embed_text
from rag_ingestion_factory.indexes.vector_models import VectorSearchResult

class MemoryVectorIndex:
    def __init__(self) -> None:
        self.vectors: dict[str, list[float]] = {}
        self.payloads: dict[str, dict] = {}

    def upsert_chunk(self, chunk: ChunkRecord, vector: list[float]) -> None:
        self.vectors[chunk.chunk_id] = vector
        self.payloads[chunk.chunk_id] = asdict(chunk)

    def search(self, query: str, limit: int = 5) -> list[VectorSearchResult]:
        query_vector = embed_text(query)
        results = [
            VectorSearchResult(chunk_id=chunk_id, score=cosine_similarity(query_vector, vector), backend="memory-vector")
            for chunk_id, vector in self.vectors.items()
        ]
        return sorted(results, key=lambda r: r.score, reverse=True)[:limit]
