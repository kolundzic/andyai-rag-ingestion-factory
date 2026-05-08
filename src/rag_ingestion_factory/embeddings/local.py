from __future__ import annotations

from rag_ingestion_factory.indexes.deterministic_embeddings import embed_text


class LocalDeterministicEmbeddingProvider:
    def __init__(self, dimensions: int = 64) -> None:
        self.dimensions = dimensions

    def embed(self, text: str) -> list[float]:
        return embed_text(text, dimensions=self.dimensions)
