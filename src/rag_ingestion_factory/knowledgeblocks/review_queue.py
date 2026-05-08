from __future__ import annotations


def queue_review(block: dict) -> dict:
    item = dict(block)
    item["review_status"] = "needs_review"
    return item
