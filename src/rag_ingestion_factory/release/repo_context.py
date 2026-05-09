from __future__ import annotations

def repo_context_summary(repo_name: str, branch: str = "main") -> dict:
    return {"repo_name": repo_name, "branch": branch, "canon": "No TAP-TAP before repo identity is confirmed."}
