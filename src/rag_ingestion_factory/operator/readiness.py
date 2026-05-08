from __future__ import annotations

from dataclasses import dataclass, asdict


@dataclass(frozen=True)
class ReadinessCheck:
    name: str
    passed: bool
    weight: int
    detail: str


def calculate_readiness_score(checks: list[ReadinessCheck]) -> dict:
    total_weight = sum(check.weight for check in checks) or 1
    passed_weight = sum(check.weight for check in checks if check.passed)
    score = round((passed_weight / total_weight) * 100, 2)

    if score >= 90:
        level = "operator-ready"
    elif score >= 75:
        level = "bridge-ready"
    elif score >= 50:
        level = "prototype-ready"
    else:
        level = "not-ready"

    return {
        "score": score,
        "level": level,
        "checks": [asdict(check) for check in checks],
    }


def default_v4_readiness_checks(
    manifest: dict,
    evidence_pack: dict,
    audit_summary: dict,
) -> list[ReadinessCheck]:
    return [
        ReadinessCheck(
            name="ingestion_completed",
            passed=manifest.get("status") == "completed",
            weight=20,
            detail="Ingestion manifest status must be completed.",
        ),
        ReadinessCheck(
            name="chunks_created",
            passed=int(manifest.get("chunks_count", 0)) > 0,
            weight=20,
            detail="At least one chunk must be created.",
        ),
        ReadinessCheck(
            name="citations_generated",
            passed=bool(evidence_pack.get("citations")),
            weight=25,
            detail="Evidence pack must include citations.",
        ),
        ReadinessCheck(
            name="answer_context_generated",
            passed=bool(evidence_pack.get("answer_context")),
            weight=15,
            detail="Evidence pack must include answer context.",
        ),
        ReadinessCheck(
            name="governance_audit_clean",
            passed=audit_summary.get("failures", 1) == 0,
            weight=20,
            detail="Governance audit must have zero failures.",
        ),
    ]
