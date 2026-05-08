from __future__ import annotations


def audit_event(stage: str, status: str) -> dict:
    return {"stage": stage, "status": status}
