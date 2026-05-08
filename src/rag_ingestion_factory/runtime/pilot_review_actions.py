from __future__ import annotations

ALLOWED_STATUSES = {"new", "reviewing", "needs_scope", "approved_for_pilot", "rejected", "archived"}


def validate_review_action(action: dict) -> tuple[bool, str]:
    for field in ("request_id", "next_status", "review_owner", "review_notes", "next_action"):
        if not action.get(field):
            return False, f"missing:{field}"
    if action["next_status"] not in ALLOWED_STATUSES:
        return False, "invalid_status"
    return True, "ok"


def apply_review_action_demo(action: dict) -> dict:
    valid, reason = validate_review_action(action)
    return {"ok": valid, "reason": reason, "action": action}
