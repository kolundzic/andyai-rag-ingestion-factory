from __future__ import annotations

from rag_ingestion_factory.retrieval.models import RetrievalCandidate
from rag_ingestion_factory.security.access_policy import AccessPolicy, PermissionContext, can_access


def filter_candidates_by_permission(
    candidates: list[RetrievalCandidate],
    policies_by_chunk_id: dict[str, AccessPolicy],
    context: PermissionContext,
) -> list[RetrievalCandidate]:
    allowed: list[RetrievalCandidate] = []
    for candidate in candidates:
        policy = policies_by_chunk_id.get(candidate.chunk_id)
        if policy is None:
            continue
        if can_access(policy, context):
            allowed.append(candidate)
    return allowed
