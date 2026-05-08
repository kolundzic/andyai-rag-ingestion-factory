from __future__ import annotations

from dataclasses import dataclass
from datetime import datetime, timezone


@dataclass(frozen=True)
class ApprovalDecision:
    decision_id: str
    subject_id: str
    status: str
    reviewer: str
    reason: str
    created_at: str


def create_approval_decision(subject_id: str, status: str, reviewer: str, reason: str = "") -> ApprovalDecision:
    return ApprovalDecision(
        decision_id=f"approval_{subject_id}_{status}",
        subject_id=subject_id,
        status=status,
        reviewer=reviewer,
        reason=reason,
        created_at=datetime.now(timezone.utc).isoformat(),
    )


def is_approved(decision: ApprovalDecision) -> bool:
    return decision.status == "approved"
