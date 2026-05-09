from __future__ import annotations

def stale_knowledge_report(item_id: str, reason: str, appearances: list[str] | None = None, dependencies: list[str] | None = None) -> dict:
    appearances = appearances or []
    dependencies = dependencies or []
    priority = "high" if dependencies else "normal"
    return {
        "item_id": item_id,
        "reason": reason,
        "appearances": appearances,
        "dependencies": dependencies,
        "recommended_action": "review_and_refresh",
        "human_review_priority": priority,
    }
