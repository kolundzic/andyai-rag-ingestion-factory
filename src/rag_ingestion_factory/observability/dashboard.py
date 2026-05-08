from __future__ import annotations


def build_observability_snapshot(events: list[dict]) -> dict:
    failures = [e for e in events if e.get("status") not in {"ok", "passed", "completed"}]
    return {
        "event_count": len(events),
        "failure_count": len(failures),
        "health": "green" if not failures else "red",
    }
