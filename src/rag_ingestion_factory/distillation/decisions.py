from __future__ import annotations

VALID_DECISIONS = {"extract", "reject", "merge", "needs_evidence", "needs_review", "approve"}


def valid_decision(decision: str) -> bool:
    return decision in VALID_DECISIONS
