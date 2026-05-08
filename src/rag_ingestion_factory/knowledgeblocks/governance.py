from __future__ import annotations

VALID_TAGS = {"public", "internal", "restricted", "confidential", "needs_review", "approved", "deprecated", "conflict_detected", "human_locked"}


def attach_governance(block: dict, tags: list[str], risk_level: str = "medium") -> dict:
    result = dict(block)
    result["governance_tags"] = [tag for tag in tags if tag in VALID_TAGS]
    result["risk_level"] = risk_level
    return result
