from __future__ import annotations

def verify_log_snapshot(log_text: str) -> dict:
    passed = "VERIFY PASSED" in log_text
    return {"passed": passed, "status": "snapshot_ready" if passed else "snapshot_failed", "lines": len(log_text.splitlines())}
