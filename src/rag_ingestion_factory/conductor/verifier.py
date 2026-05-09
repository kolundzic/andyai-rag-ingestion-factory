from __future__ import annotations

def verify_knowledge_answer(answer: str, evidence_sources: list[str]) -> dict:
    status = "verified" if answer and evidence_sources else "insufficient_evidence"
    return {"status": status, "evidence_count": len(evidence_sources)}
