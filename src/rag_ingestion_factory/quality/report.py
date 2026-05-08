from __future__ import annotations

from .knowledge_quality import quality_score


def quality_report(blocks: list[dict]) -> dict:
    scores = [quality_score(block) for block in blocks]
    return {"count": len(scores), "average_score": round(sum(scores) / len(scores), 2) if scores else 0}
