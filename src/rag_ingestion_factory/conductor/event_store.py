from __future__ import annotations
from datetime import datetime, timezone

def conductor_event_record(event_type: str, payload: dict | None = None) -> dict:
    return {
        "event_type": event_type,
        "payload": payload or {},
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "status": "event_ready",
    }
