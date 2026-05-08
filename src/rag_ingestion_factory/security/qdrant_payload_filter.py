from __future__ import annotations

from rag_ingestion_factory.security.access_policy import PermissionContext


def build_qdrant_permission_filter_payload(context: PermissionContext) -> dict:
    """
    Build a Qdrant-style filter payload.

    This is intentionally represented as a plain dict so tests do not require qdrant-client.
    Production adapter can convert it into qdrant_client.models.Filter.
    """
    return {
        "must": [
            {"key": "tenant_id", "match": {"value": context.tenant_id}},
            {"key": "allowed_roles", "match_any": {"any": list(context.roles)}},
        ],
        "should": [
            {"key": "allowed_users", "match": {"value": context.user_id}},
        ],
        "minimum_should_match": 0,
        "clearance_level": context.clearance_level,
    }
