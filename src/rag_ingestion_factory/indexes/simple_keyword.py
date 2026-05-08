from __future__ import annotations

from collections import defaultdict

from rag_ingestion_factory.core.models import ChunkRecord


def build_simple_keyword_index(chunks: list[ChunkRecord]) -> dict[str, list[str]]:
    index: dict[str, set[str]] = defaultdict(set)

    for chunk in chunks:
        words = chunk.text.lower().replace(".", " ").replace(",", " ").split()
        for word in words:
            if len(word) >= 4:
                index[word].add(chunk.chunk_id)

    return {word: sorted(ids) for word, ids in sorted(index.items())}
