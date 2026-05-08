from __future__ import annotations

from .candidate import make_candidate


def distill_candidate(raw_chunk_id: str, claim: str) -> dict:
    candidate = make_candidate(raw_chunk_id, claim)
    candidate["decision"] = "needs_review"
    return candidate
