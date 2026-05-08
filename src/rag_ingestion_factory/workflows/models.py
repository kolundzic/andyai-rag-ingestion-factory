from __future__ import annotations

from dataclasses import dataclass, field, asdict


@dataclass(frozen=True)
class WorkflowStep:
    step_id: str
    step_type: str
    status: str
    evidence_refs: tuple[str, ...] = field(default_factory=tuple)
    human_required: bool = False

    def to_dict(self) -> dict:
        return asdict(self)


@dataclass(frozen=True)
class WorkflowRun:
    workflow_run_id: str
    workflow_type: str
    status: str
    steps: tuple[WorkflowStep, ...] = field(default_factory=tuple)

    def to_dict(self) -> dict:
        return asdict(self)


@dataclass(frozen=True)
class ReviewItem:
    review_item_id: str
    workflow_run_id: str
    subject_type: str
    subject_id: str
    proposed_action: str
    evidence_refs: tuple[str, ...] = field(default_factory=tuple)
    status: str = "pending"

    def to_dict(self) -> dict:
        return asdict(self)


@dataclass(frozen=True)
class ExportBundle:
    export_bundle_id: str
    export_target: str
    approval_status: str
    evidence_refs: tuple[str, ...] = field(default_factory=tuple)
    source_refs: tuple[str, ...] = field(default_factory=tuple)

    def to_dict(self) -> dict:
        return asdict(self)
