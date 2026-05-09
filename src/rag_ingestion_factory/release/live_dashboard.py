from __future__ import annotations

def live_release_dashboard_status() -> dict:
    return {
        "status": "live_dashboard_ready",
        "panels": ["release_history", "latest_release", "health_rollup", "incidents", "evidence_store", "public_proof"],
    }
