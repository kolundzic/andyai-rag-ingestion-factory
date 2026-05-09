from __future__ import annotations

def approval_console_status() -> dict:
    return {"status": "approval_console_ready", "actions": ["approve", "reject", "request_changes", "send_to_retry"]}

def retry_console_status() -> dict:
    return {"status": "retry_console_ready", "strategies": ["change_worker", "change_retrieval_path", "request_more_evidence", "human_review"]}
