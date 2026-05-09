from __future__ import annotations

def conductor_human_approval_gate(high_impact: bool) -> dict:
    return {"approval_required": bool(high_impact), "status": "approval_gate_ready"}
