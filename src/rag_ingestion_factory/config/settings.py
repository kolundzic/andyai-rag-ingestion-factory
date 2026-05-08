from __future__ import annotations

from dataclasses import dataclass
import os


@dataclass(frozen=True)
class Settings:
    qdrant_url: str
    qdrant_collection: str
    postgres_dsn: str
    embedding_dimensions: int


def load_settings() -> Settings:
    return Settings(
        qdrant_url=os.getenv("ANDYAI_QDRANT_URL", "http://localhost:6333"),
        qdrant_collection=os.getenv("ANDYAI_QDRANT_COLLECTION", "andyai_chunks"),
        postgres_dsn=os.getenv(
            "ANDYAI_POSTGRES_DSN",
            "postgresql://andyai:andyai_dev@localhost:5432/andyai_rag",
        ),
        embedding_dimensions=int(os.getenv("ANDYAI_EMBEDDING_DIMENSIONS", "64")),
    )
