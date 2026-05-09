from __future__ import annotations

def retry_strategy(failure_reason: str) -> dict:
    retry = failure_reason in {"missing_evidence", "stale_source", "low_confidence", "worker_failed"}
    strategy = "change_strategy_and_retry" if retry else "manual_review"
    return {"failure_reason": failure_reason, "retry": retry, "strategy": strategy}
