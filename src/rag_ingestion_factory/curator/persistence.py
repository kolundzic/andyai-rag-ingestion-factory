from __future__ import annotations

CURATOR_TABLES = ["curator_tasks", "curator_reports", "curator_events", "curator_reviews", "curator_scores", "curator_actions"]

def curator_persistence_status() -> dict:
    return {"version": "v32.1.0", "status": "curator-persistence-schema-ready", "tables": CURATOR_TABLES}
