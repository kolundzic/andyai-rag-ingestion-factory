from __future__ import annotations

def assign_worker_role(task_type: str) -> dict:
    t = task_type.lower()
    if "verify" in t:
        role = "verifier"
    elif "graph" in t:
        role = "graph_worker"
    elif "source" in t:
        role = "source_worker"
    elif "merge" in t:
        role = "knowledgeblock_merge_worker"
    else:
        role = "retrieval_worker"
    return {"task_type": task_type, "role": role, "status": "assigned"}
