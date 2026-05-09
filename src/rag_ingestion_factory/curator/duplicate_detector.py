from __future__ import annotations
from difflib import SequenceMatcher

def similarity(a: str, b: str) -> float:
    return SequenceMatcher(None, a.strip().lower(), b.strip().lower()).ratio()

def detect_duplicate_pair(a: str, b: str, threshold: float = 0.88) -> dict:
    score = similarity(a, b)
    return {"score": score, "is_duplicate": score >= threshold, "recommended_action": "merge_review" if score >= threshold else "keep_separate"}
