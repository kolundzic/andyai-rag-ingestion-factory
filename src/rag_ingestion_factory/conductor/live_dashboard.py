from __future__ import annotations

def conductor_live_dashboard_status() -> dict:
    return {
        "status": "live_conductor_dashboard_ready",
        "panels": ["events", "timeline", "workers", "strategy", "approval", "retry", "evidence", "trusted_outcome"],
    }
