from __future__ import annotations

from .checks import approval_score, evidence_score, permission_score


def quality_score(block: dict) -> int:
    return evidence_score(block) + approval_score(block) + permission_score(block)
