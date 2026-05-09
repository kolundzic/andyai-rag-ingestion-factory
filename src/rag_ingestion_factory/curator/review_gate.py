from __future__ import annotations

def review_gate_decision(action: dict, decision: str, reviewer: str = "human_operator", note: str = "") -> dict:
    if decision not in {"approved", "rejected", "needs_changes"}:
        raise ValueError("decision must be approved, rejected, or needs_changes")
    return {"action_type": action.get("action_type"), "target_ref": action.get("target_ref"), "previous_status": action.get("status", "planned"), "decision": decision, "reviewer": reviewer, "note": note, "canonical_allowed": decision == "approved"}
