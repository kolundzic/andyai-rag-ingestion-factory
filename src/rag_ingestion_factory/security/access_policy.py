from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any


CLASSIFICATION_ORDER = {
    "public": 0,
    "internal": 1,
    "confidential": 2,
    "restricted": 3,
}


@dataclass(frozen=True)
class AccessPolicy:
    tenant_id: str
    classification: str = "internal"
    allowed_roles: tuple[str, ...] = field(default_factory=tuple)
    allowed_users: tuple[str, ...] = field(default_factory=tuple)
    source_system: str = "unknown"
    permission_source: str = "manual"


@dataclass(frozen=True)
class PermissionContext:
    user_id: str
    tenant_id: str
    roles: tuple[str, ...] = field(default_factory=tuple)
    clearance_level: str = "internal"


def access_policy_from_payload(payload: dict[str, Any] | None) -> AccessPolicy:
    payload = payload or {}
    return AccessPolicy(
        tenant_id=str(payload.get("tenant_id", "default")),
        classification=str(payload.get("classification", "internal")),
        allowed_roles=tuple(payload.get("allowed_roles", []) or []),
        allowed_users=tuple(payload.get("allowed_users", []) or []),
        source_system=str(payload.get("source_system", "unknown")),
        permission_source=str(payload.get("permission_source", "manual")),
    )


def can_access(policy: AccessPolicy, context: PermissionContext) -> bool:
    if policy.tenant_id != context.tenant_id:
        return False

    required_level = CLASSIFICATION_ORDER.get(policy.classification, 1)
    user_level = CLASSIFICATION_ORDER.get(context.clearance_level, 1)
    if user_level < required_level:
        return False

    if policy.allowed_users and context.user_id in policy.allowed_users:
        return True

    if policy.allowed_roles and set(policy.allowed_roles).intersection(context.roles):
        return True

    if not policy.allowed_users and not policy.allowed_roles:
        return True

    return False
