from __future__ import annotations

CURATOR_ACTION_TYPES = ["refresh_source", "merge_duplicate", "repair_graph_edge", "attach_evidence", "request_human_review", "mark_stale", "verify_fix"]

def curator_action_types() -> list[str]:
    return list(CURATOR_ACTION_TYPES)

def create_curator_action(action_type: str, target_ref: str, payload: dict | None = None) -> dict:
    if action_type not in CURATOR_ACTION_TYPES:
        raise ValueError(f"Unsupported curator action type: {action_type}")
    return {"action_type": action_type, "target_ref": target_ref, "payload": payload or {}, "status": "planned"}
