from __future__ import annotations
from rag_ingestion_factory.retrieval.models import RetrievalCandidate

def rerank_candidates(query: str, candidates: list[RetrievalCandidate], limit: int = 5) -> list[RetrievalCandidate]:
    terms = [t.lower() for t in query.split() if len(t) >= 3]
    def rank_score(candidate: RetrievalCandidate) -> float:
        text_l = candidate.text.lower()
        overlap = sum(1 for term in terms if term in text_l) / max(len(terms), 1)
        length_penalty = min(len(candidate.text) / 4000.0, 0.25)
        return candidate.score + (0.25 * overlap) - length_penalty
    return sorted(candidates, key=rank_score, reverse=True)[:limit]
