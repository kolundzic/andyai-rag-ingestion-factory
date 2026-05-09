from __future__ import annotations

def release_timeline(versions: list[str]) -> dict:
    return {"versions": versions, "count": len(versions), "status": "timeline_ready"}
