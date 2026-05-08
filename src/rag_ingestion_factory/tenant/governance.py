from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class TenantBoundary:
    tenant_id: str
    allowed_collections: tuple[str, ...]
    allowed_roles: tuple[str, ...]


def tenant_can_use_collection(boundary: TenantBoundary, collection: str) -> bool:
    return collection in boundary.allowed_collections
