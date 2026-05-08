from __future__ import annotations


def create_audit_event(pilot_request_id: str, actor: str, from_status: str, to_status: str, reason: str) -> dict:
    return {
        "pilot_request_id": pilot_request_id,
        "actor": actor,
        "action": "review_status_changed",
        "from_status": from_status,
        "to_status": to_status,
        "reason": reason,
    }


def summarize_audit_events(events: list[dict]) -> dict[str, int]:
    return {
        "total": len(events),
        "status_changes": sum(1 for event in events if event.get("action") == "review_status_changed"),
    }
