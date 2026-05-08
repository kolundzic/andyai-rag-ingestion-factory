from __future__ import annotations

from dataclasses import asdict
from typing import Any

from rag_ingestion_factory.core.models import ChunkRecord
from rag_ingestion_factory.indexes.vector_models import VectorSearchResult


class QdrantDependencyError(RuntimeError):
    pass


class QdrantVectorIndex:
    """
    Production-shaped Qdrant adapter.

    It uses chunk_id as the point ID and stores document/page metadata as payload.
    """

    def __init__(
        self,
        url: str = "http://localhost:6333",
        collection_name: str = "andyai_chunks",
        vector_size: int = 64,
    ) -> None:
        try:
            from qdrant_client import QdrantClient  # type: ignore
            from qdrant_client.models import Distance, VectorParams  # type: ignore
        except Exception as exc:
            raise QdrantDependencyError(
                "Qdrant adapter requires qdrant-client. Install with: python3 -m pip install qdrant-client"
            ) from exc

        self.url = url
        self.collection_name = collection_name
        self.vector_size = vector_size
        self.client = QdrantClient(url=url)
        self._Distance = Distance
        self._VectorParams = VectorParams

    def ensure_collection(self) -> None:
        collections = self.client.get_collections().collections
        existing = {c.name for c in collections}
        if self.collection_name in existing:
            return

        self.client.create_collection(
            collection_name=self.collection_name,
            vectors_config=self._VectorParams(size=self.vector_size, distance=self._Distance.COSINE),
        )

    def upsert_chunk(self, chunk: ChunkRecord, vector: list[float]) -> None:
        try:
            from qdrant_client.models import PointStruct  # type: ignore
        except Exception as exc:
            raise QdrantDependencyError("qdrant-client models unavailable") from exc

        self.ensure_collection()
        payload: dict[str, Any] = asdict(chunk)
        self.client.upsert(
            collection_name=self.collection_name,
            points=[
                PointStruct(
                    id=chunk.chunk_id,
                    vector=vector,
                    payload=payload,
                )
            ],
        )

    def search_vector(self, vector: list[float], limit: int = 5) -> list[VectorSearchResult]:
        self.ensure_collection()
        result = self.client.search(
            collection_name=self.collection_name,
            query_vector=vector,
            limit=limit,
        )
        return [
            VectorSearchResult(
                chunk_id=str(point.id),
                score=float(point.score),
                backend="qdrant",
            )
            for point in result
        ]

    def search(self, query: str, limit: int = 5):
        raise NotImplementedError(
            "Use search_vector(vector, limit) with an embedding provider. Query-to-vector belongs to embedding layer."
        )
