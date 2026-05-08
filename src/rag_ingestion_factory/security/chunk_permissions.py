from __future__ import annotations

from rag_ingestion_factory.core.models import ChunkRecord
from rag_ingestion_factory.security.access_policy import AccessPolicy, PermissionContext, can_access


def attach_policy_to_chunk_payload(chunk: ChunkRecord, policy: AccessPolicy) -> dict:
    return {
        "chunk": chunk,
        "access_policy": policy,
    }


def filter_chunk_payloads_by_permission(payloads: list[dict], context: PermissionContext) -> list[dict]:
    allowed: list[dict] = []
    for payload in payloads:
        policy = payload.get("access_policy")
        if policy is None:
            continue
        if can_access(policy, context):
            allowed.append(payload)
    return allowed
