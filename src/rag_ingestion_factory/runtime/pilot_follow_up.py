from __future__ import annotations


def draft_for_status(status: str) -> dict:
    mapping = {
        "approved_for_pilot": "Next step: pilot review call",
        "needs_scope": "Next step: scoping call",
        "rejected": "Pilot request update",
        "reviewing": "Pilot request under review",
    }
    return {"status": status, "subject": mapping.get(status, mapping["reviewing"])}
