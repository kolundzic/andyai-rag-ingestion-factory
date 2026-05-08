from __future__ import annotations

from dataclasses import dataclass, field, asdict
from typing import Any


@dataclass(frozen=True)
class EvidenceRef:
    document_id: str
    page: int | None = None
    source_hash: str = ""
    quote_hash: str = ""
    pipeline_version: str = ""


@dataclass(frozen=True)
class KnowledgeBlock:
    id: str
    question: str
    answer: str
    claim: str
    source_document_id: str
    evidence_refs: list[EvidenceRef] = field(default_factory=list)
    confidence: float = 0.0
    version: str = "v1"
    status: str = "candidate"
    governance_tags: list[str] = field(default_factory=list)
    human_review_state: str = "needs_review"

    def to_dict(self) -> dict[str, Any]:
        return asdict(self)


def sample_knowledgeblock() -> KnowledgeBlock:
    return KnowledgeBlock(
        id="kb-demo-001",
        question="What is a KnowledgeBlock?",
        answer="A KnowledgeBlock is a structured, evidence-backed, versioned, reviewable unit of knowledge.",
        claim="KnowledgeBlocks are governed units of knowledge, not raw chunks.",
        source_document_id="demo-doc-001",
        evidence_refs=[EvidenceRef(document_id="demo-doc-001", page=1, source_hash="demo-source-hash")],
        confidence=0.92,
        status="candidate",
        governance_tags=["internal", "needs_review"],
    )
