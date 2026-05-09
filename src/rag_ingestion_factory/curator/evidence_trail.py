from __future__ import annotations
from datetime import datetime, timezone

def curator_evidence_trail(source: str, reason: str, old_state: dict, new_state: dict, operator: str = "human_operator") -> dict:
    return {"source": source, "reason": reason, "old_state": old_state, "new_state": new_state, "operator": operator, "timestamp": datetime.now(timezone.utc).isoformat(), "approval": "pending", "verification_result": "pending"}
