from __future__ import annotations

RUN_TYPES = ["daily_freshness_scan", "weekly_duplicate_scan", "weekly_graph_hygiene_scan", "monthly_evidence_quality_scan", "manual_operator_scan"]

def scheduled_hygiene_run(run_type: str, scope: str = "project") -> dict:
    if run_type not in RUN_TYPES:
        raise ValueError(f"Unsupported hygiene run type: {run_type}")
    return {"run_type": run_type, "scope": scope, "status": "scheduled", "steps": ["scan", "score", "report", "queue_review"]}
