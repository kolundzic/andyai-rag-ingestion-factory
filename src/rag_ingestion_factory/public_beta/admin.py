from __future__ import annotations

def feedback_admin_view() -> dict:
    return {"status": "feedback_admin_ready", "queue": "public_interest"}

def pilot_intake_admin_view() -> dict:
    return {"status": "pilot_admin_ready", "queue": "pilot_intake"}
