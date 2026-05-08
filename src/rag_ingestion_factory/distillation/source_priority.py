from __future__ import annotations


def source_priority(item: dict) -> int:
    score = 0
    if item.get("human_review_state") == "approved":
        score += 10
    if item.get("status") == "approved":
        score += 5
    score += int(item.get("confidence", 0) * 10)
    return score
