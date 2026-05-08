from __future__ import annotations


def attach_evidence(block: dict, evidence_refs: list[dict]) -> dict:
    result = dict(block)
    result["evidence_refs"] = evidence_refs
    result["has_evidence"] = bool(evidence_refs)
    return result
