from __future__ import annotations

from dataclasses import dataclass, field, asdict


@dataclass(frozen=True)
class KnowledgeNode:
    node_id: str
    node_type: str
    title: str
    summary: str = ""
    source_refs: tuple[str, ...] = field(default_factory=tuple)
    approval_status: str = "draft"

    def to_dict(self) -> dict:
        return asdict(self)


@dataclass(frozen=True)
class KnowledgeEdge:
    edge_id: str
    from_node_id: str
    to_node_id: str
    edge_type: str
    confidence: float = 0.0
    evidence_refs: tuple[str, ...] = field(default_factory=tuple)

    def to_dict(self) -> dict:
        return asdict(self)


@dataclass(frozen=True)
class Claim:
    claim_id: str
    text: str
    claim_type: str = "statement"
    confidence: float = 0.0
    source_refs: tuple[str, ...] = field(default_factory=tuple)
    evidence_pack_id: str = ""
    approval_status: str = "extracted"

    def to_dict(self) -> dict:
        return asdict(self)
