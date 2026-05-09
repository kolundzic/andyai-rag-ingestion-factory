from __future__ import annotations

def evidence_quality_score(
    has_source_trace: bool,
    has_quote_anchor: bool,
    confidence: float,
    recency_score: float,
    authority_score: float,
    approved: bool,
    contradiction_risk: float,
) -> dict:
    score = 0
    score += 20 if has_source_trace else 0
    score += 15 if has_quote_anchor else 0
    score += max(0, min(20, confidence * 20))
    score += max(0, min(15, recency_score * 15))
    score += max(0, min(15, authority_score * 15))
    score += 10 if approved else 0
    score -= max(0, min(20, contradiction_risk * 20))
    score = round(max(0, min(100, score)), 2)
    status = "strong" if score >= 75 else "needs_review" if score >= 45 else "weak"
    return {"score": score, "status": status}
