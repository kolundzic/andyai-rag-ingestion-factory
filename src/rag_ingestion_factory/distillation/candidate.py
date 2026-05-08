from __future__ import annotations


def make_candidate(raw_chunk_id: str, claim: str) -> dict:
    return {"candidate_id": f"candidate-{raw_chunk_id}", "raw_chunk_id": raw_chunk_id, "claim": claim, "status": "candidate"}
