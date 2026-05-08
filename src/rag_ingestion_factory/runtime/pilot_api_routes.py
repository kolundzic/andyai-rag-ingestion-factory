from __future__ import annotations


def summarize_pilot_items(items: list[dict]) -> dict[str, int]:
    return {
        "total": len(items),
        "approved_for_pilot": sum(1 for item in items if item.get("status") == "approved_for_pilot"),
        "needs_scope": sum(1 for item in items if item.get("status") == "needs_scope"),
        "high_priority": sum(1 for item in items if item.get("priority") == "high"),
    }


def demo_create_response(payload: dict) -> dict:
    return {
        "ok": True,
        "mode": "mock-write-guarded",
        "data": {
            "id": "pilot-created-demo-001",
            **payload,
            "review_status": "new",
            "next_action": "assign reviewer",
        },
    }
