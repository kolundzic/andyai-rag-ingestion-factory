from __future__ import annotations

def release_evidence_pack(version: str, base_tag: str) -> dict:
    return {"version": version, "base_tag": base_tag, "verify_result": "pending", "commit_hash": "pending", "tag_name": version, "push_status": "pending", "metadata_status": "pending", "incident_status": "none", "operator_note": "pending"}
