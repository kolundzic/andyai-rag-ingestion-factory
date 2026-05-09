from __future__ import annotations
from datetime import datetime, timezone

def release_evidence_record(version: str, base_tag: str, health: str) -> dict:
    return {
        "version": version,
        "base_tag": base_tag,
        "health": health,
        "verify_status": "passed" if health == "green" else "review_required",
        "recorded_at": datetime.now(timezone.utc).isoformat(),
        "status": "record_ready",
    }

def release_history_query(limit: int = 20, project: str = "andyai-rag-ingestion-factory") -> dict:
    return {"project": project, "limit": limit, "status": "query_ready"}
