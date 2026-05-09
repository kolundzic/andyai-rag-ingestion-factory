from __future__ import annotations

def curator_health_score(freshness: float, duplicates: float, evidence_quality: float, graph_health: float, review_backlog: float, verified_fixes: float, stale_risk: float) -> dict:
    score = freshness*0.18 + (100-duplicates)*0.14 + evidence_quality*0.20 + graph_health*0.16 + (100-review_backlog)*0.12 + verified_fixes*0.10 + (100-stale_risk)*0.10
    score = round(max(0, min(100, score)), 2)
    status = "green" if score >= 75 else "yellow" if score >= 50 else "red"
    return {"score": score, "status": status}
