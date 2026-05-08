from __future__ import annotations


def can_index(block: dict) -> bool:
    return block.get("status") in {"approved", "human_locked"} or block.get("human_review_state") == "approved"
