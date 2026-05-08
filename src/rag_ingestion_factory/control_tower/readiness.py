from __future__ import annotations

from rag_ingestion_factory.control_tower.models import DeployReadinessCheck


def calculate_deploy_readiness(checks: list[DeployReadinessCheck]) -> dict:
    if not checks:
        return {"score": 0, "level": "not-ready", "blocking_failures": 0}

    required = [c for c in checks if c.required]
    blocking_failures = sum(1 for c in required if c.status == "fail")
    pass_weight = 0
    total_weight = 0

    for check in checks:
        weight = 2 if check.required else 1
        total_weight += weight
        if check.status == "pass":
            pass_weight += weight
        elif check.status == "warning":
            pass_weight += weight * 0.5

    score = round((pass_weight / total_weight) * 100, 2)

    if blocking_failures:
        level = "blocked"
    elif score >= 90:
        level = "production-ready"
    elif score >= 75:
        level = "deploy-candidate"
    elif score >= 50:
        level = "needs-work"
    else:
        level = "not-ready"

    return {
        "score": score,
        "level": level,
        "blocking_failures": blocking_failures,
    }


def build_default_v16_checks() -> list[DeployReadinessCheck]:
    return [
        DeployReadinessCheck("repo_verify", "repo", "pass", True, "Local verify passes."),
        DeployReadinessCheck("vercel_shell_exists", "vercel", "pass", True, "Vercel product shell exists."),
        DeployReadinessCheck("supabase_schema_exists", "supabase", "pass", True, "Supabase runtime schema exists."),
        DeployReadinessCheck("env_documented", "env", "pass", True, "Environment checklist exists."),
        DeployReadinessCheck("domain_locked", "domain", "pass", True, "knowledgefactory.andyai.ai is locked."),
        DeployReadinessCheck("rollback_documented", "rollback", "pass", True, "Rollback plan exists."),
        DeployReadinessCheck("live_qdrant_planned", "qdrant", "warning", False, "Live Qdrant connection remains a future gate."),
    ]
