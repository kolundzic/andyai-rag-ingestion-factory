from __future__ import annotations

from typing import Any

from rag_ingestion_factory.security.access_policy import AccessPolicy


def build_qdrant_chunk_payload(chunk_payload: dict[str, Any], policy: AccessPolicy) -> dict[str, Any]:
    payload = dict(chunk_payload)
    payload.update(
        {
            "tenant_id": policy.tenant_id,
            "classification": policy.classification,
            "allowed_roles": list(policy.allowed_roles),
            "allowed_users": list(policy.allowed_users),
            "source_system": policy.source_system,
            "permission_source": policy.permission_source,
        }
    )
    return payload
