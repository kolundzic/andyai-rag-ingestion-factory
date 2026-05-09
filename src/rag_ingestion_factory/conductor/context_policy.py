from __future__ import annotations

def context_access_policy(worker_role: str) -> dict:
    if worker_role in {"verifier", "graph_worker"}:
        access = "evidence_plus_answer"
    elif worker_role == "retrieval_worker":
        access = "limited"
    else:
        access = "role_scoped"
    return {"worker_role": worker_role, "access": access, "status": "policy_applied"}
