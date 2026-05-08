from __future__ import annotations


def evaluate_evidence_pack(evidence_pack: dict) -> dict:
    citations = evidence_pack.get("citations", [])
    context = evidence_pack.get("answer_context", "")
    score = 0
    if citations:
        score += 40
    if context:
        score += 40
    if evidence_pack.get("candidate_count", 0) >= len(citations):
        score += 20
    return {
        "citation_count": len(citations),
        "has_answer_context": bool(context),
        "score": score,
        "level": "pass" if score >= 80 else "review",
    }
