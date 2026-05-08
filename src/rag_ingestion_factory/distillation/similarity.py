from __future__ import annotations


def token_similarity(left: str, right: str) -> float:
    a = set(left.lower().split())
    b = set(right.lower().split())
    if not a and not b:
        return 1.0
    if not a or not b:
        return 0.0
    return len(a & b) / len(a | b)
