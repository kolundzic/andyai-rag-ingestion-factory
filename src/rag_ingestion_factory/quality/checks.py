from __future__ import annotations


def evidence_score(block: dict) -> int:
    return 30 if block.get("evidence_refs") else 0


def approval_score(block: dict) -> int:
    return 40 if block.get("human_review_state") == "approved" or block.get("status") == "approved" else 0


def permission_score(block: dict) -> int:
    return 30 if block.get("governance_tags") else 0
