from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class ExternalGatewayPolicy:
    allow_external: bool = True
    require_citations: bool = True
    max_citations: int = 10
    require_human_approval: bool = True


@dataclass(frozen=True)
class GatewayDecision:
    allowed: bool
    reason: str


def can_externalize_evidence_pack(evidence_pack: dict, policy: ExternalGatewayPolicy) -> GatewayDecision:
    if not policy.allow_external:
        return GatewayDecision(False, "externalization_disabled")

    citations = evidence_pack.get("citations", [])
    if policy.require_citations and not citations:
        return GatewayDecision(False, "citations_required")

    if len(citations) > policy.max_citations:
        return GatewayDecision(False, "too_many_citations")

    return GatewayDecision(True, "allowed")
