from __future__ import annotations

LIFECYCLE = [
    "raw_chunk",
    "candidate_knowledgeblock",
    "evidence_matched",
    "duplicate_checked",
    "governance_tagged",
    "human_reviewed",
    "canonical_knowledgeblock",
]


def knowledgeblock_lifecycle() -> list[str]:
    return list(LIFECYCLE)
