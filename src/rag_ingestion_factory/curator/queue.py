from __future__ import annotations

QUEUE_STATUSES = ["new", "triaged", "in_review", "approved", "rejected", "fixed", "verified", "archived"]

def curator_queue_statuses() -> list[str]:
    return list(QUEUE_STATUSES)

def create_queue_item(task_type: str, target_ref: str, severity: str = "medium") -> dict:
    return {"task_type": task_type, "target_ref": target_ref, "severity": severity, "status": "new", "history": [{"event": "created", "status": "new"}]}

def transition_queue_item(item: dict, new_status: str) -> dict:
    if new_status not in QUEUE_STATUSES:
        raise ValueError(f"Unsupported curator queue status: {new_status}")
    updated = dict(item)
    updated["status"] = new_status
    updated.setdefault("history", []).append({"event": "transition", "status": new_status})
    return updated
