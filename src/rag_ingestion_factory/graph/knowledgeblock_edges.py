from __future__ import annotations


def evidence_edge(block_id: str, source_id: str) -> dict:
    return {"from": block_id, "to": source_id, "type": "supported_by"}
