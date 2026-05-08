from __future__ import annotations
from dataclasses import dataclass, asdict
from datetime import datetime, timezone
from typing import Any

@dataclass(frozen=True)
class AuditEvent:
    event_type: str
    status: str
    payload: dict[str, Any]
    created_at: str

class GovernanceAuditLog:
    def __init__(self) -> None:
        self.events: list[AuditEvent] = []

    def record(self, event_type: str, status: str, payload: dict[str, Any] | None = None) -> AuditEvent:
        event = AuditEvent(event_type, status, payload or {}, datetime.now(timezone.utc).isoformat())
        self.events.append(event)
        return event

    def summary(self) -> dict[str, Any]:
        failures = [e for e in self.events if e.status not in {"passed", "completed", "ok"}]
        return {"events": len(self.events), "failures": len(failures), "statuses": [e.status for e in self.events]}

    def to_dicts(self) -> list[dict[str, Any]]:
        return [asdict(event) for event in self.events]
