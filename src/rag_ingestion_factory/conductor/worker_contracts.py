from __future__ import annotations

def worker_execution_contract(role: str) -> dict:
    return {
        "role": role,
        "required_fields": ["task_id", "role", "input", "context_policy", "expected_output", "evidence_required"],
        "status": "contract_ready",
    }

def worker_result_envelope(status: str, evidence: list[str] | None = None) -> dict:
    return {
        "status": status,
        "evidence": evidence or [],
        "failure_reason": None if status == "success" else "needs_review",
        "retry_suggestion": None if status == "success" else "change_strategy_and_retry",
    }
