from __future__ import annotations
from rag_ingestion_factory.core.models import ChunkRecord

class QdrantDependencyError(RuntimeError):
    pass

class QdrantVectorIndex:
    def __init__(self, url: str = "http://localhost:6333", collection_name: str = "andyai_chunks") -> None:
        try:
            from qdrant_client import QdrantClient  # type: ignore
        except Exception as exc:
            raise QdrantDependencyError(
                "Qdrant adapter requires qdrant-client. Install with: python3 -m pip install qdrant-client"
            ) from exc
        self.url = url
        self.collection_name = collection_name
        self.client = QdrantClient(url=url)

    def upsert_chunk(self, chunk: ChunkRecord, vector: list[float]) -> None:
        raise NotImplementedError("Production Qdrant upsert will be implemented after schema lock.")

    def search(self, query: str, limit: int = 5):
        raise NotImplementedError("Production Qdrant search will be implemented after schema lock.")
