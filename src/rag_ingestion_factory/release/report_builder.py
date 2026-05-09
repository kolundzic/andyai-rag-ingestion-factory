from __future__ import annotations

def release_evidence_report(version: str) -> dict:
    return {"version": version, "formats": ["json", "markdown"], "status": "report_ready"}
