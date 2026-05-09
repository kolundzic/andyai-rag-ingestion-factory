from __future__ import annotations

def source_freshness_score(age_days: int, has_newer_version: bool = False, conflict_detected: bool = False) -> dict:
    score = 100
    if age_days > 365:
        score -= 40
    elif age_days > 180:
        score -= 25
    elif age_days > 90:
        score -= 10
    if has_newer_version:
        score -= 35
    if conflict_detected:
        score -= 30
    score = max(0, score)
    status = "fresh" if score >= 75 else "needs_review" if score >= 40 else "stale"
    return {"freshness_score": score, "status": status, "review_priority": "high" if status == "stale" else "normal"}
