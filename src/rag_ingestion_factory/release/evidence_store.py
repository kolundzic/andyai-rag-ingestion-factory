from __future__ import annotations

def evidence_store_status() -> dict:
    return {"status": "store_ready", "tables": ["release_evidence", "release_events", "release_incidents", "release_health"]}
