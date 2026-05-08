from __future__ import annotations

from dataclasses import dataclass, asdict
from typing import Iterable


@dataclass(frozen=True)
class PilotRequestRecord:
    id: str
    tenant_id: str
    workspace_id: str
    name: str
    email: str
    organization: str
    document_count_range: str
    primary_domain: str
    main_problem: str
    success_criteria: str
    privacy_level: str
    qualification_score: int
    qualification_status: str
    review_status: str
    priority: str
    next_action: str


def demo_pilot_request_record() -> PilotRequestRecord:
    return PilotRequestRecord(
        id="demo-persisted-pilot-001",
        tenant_id="demo-tenant",
        workspace_id="demo-workspace",
        name="Demo Client",
        email="client@example.com",
        organization="Example Organization",
        document_count_range="50–200 documents",
        primary_domain="technical documentation",
        main_problem="We need evidence-backed search across technical PDFs and internal reports.",
        success_criteria="Users should find answers faster and verify source documents.",
        privacy_level="internal business documents",
        qualification_score=100,
        qualification_status="green",
        review_status="approved_for_pilot",
        priority="high",
        next_action="Schedule pilot review call",
    )


def summarize_records(records: Iterable[PilotRequestRecord]) -> dict[str, int]:
    items = list(records)
    return {
        "total": len(items),
        "approved_for_pilot": sum(1 for item in items if item.review_status == "approved_for_pilot"),
        "needs_scope": sum(1 for item in items if item.review_status == "needs_scope"),
        "high_priority": sum(1 for item in items if item.priority == "high"),
    }


def to_payload(record: PilotRequestRecord) -> dict[str, object]:
    return asdict(record)
