from __future__ import annotations

from dataclasses import dataclass, field, asdict


@dataclass(frozen=True)
class VectorAdapterCandidate:
    adapter_id: str
    backend: str
    capabilities: tuple[str, ...] = field(default_factory=tuple)
    self_hosted: bool = True
    permission_filtering: bool = False
    evidence_metadata_required: bool = True

    def to_dict(self) -> dict:
        return asdict(self)


@dataclass(frozen=True)
class RetrievalLabRun:
    run_id: str
    adapter_backend: str
    embedding_model: str
    document_count: int = 0
    page_count: int = 0
    chunk_count: int = 0
    status: str = "planned"
    strict_context_policy: bool = True

    def to_dict(self) -> dict:
        return asdict(self)
