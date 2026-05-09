from __future__ import annotations

def real_release_evidence(version: str, base_tag: str) -> dict:
    return {
        "version": version,
        "base_tag": base_tag,
        "status": "evidence_ready",
        "captures": ["verify", "commit", "tag", "push", "metadata", "operator_note"],
    }
