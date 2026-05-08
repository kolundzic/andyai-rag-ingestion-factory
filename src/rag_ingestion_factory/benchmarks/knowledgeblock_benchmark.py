from __future__ import annotations

from .metrics import reduction_ratio


def benchmark_run(raw_chunks: int, knowledgeblocks: int) -> dict:
    return {"raw_chunks": raw_chunks, "knowledgeblocks": knowledgeblocks, "corpus_reduction_ratio": reduction_ratio(raw_chunks, knowledgeblocks)}
