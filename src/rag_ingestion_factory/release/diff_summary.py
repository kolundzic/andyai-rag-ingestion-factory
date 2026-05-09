from __future__ import annotations

def previous_vs_current_summary(previous: str, current: str) -> dict:
    return {"previous": previous, "current": current, "status": "summary_ready", "sections": ["files", "docs", "schemas", "routes", "tests", "release_notes"]}
