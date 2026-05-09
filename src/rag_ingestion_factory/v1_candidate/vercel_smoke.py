from __future__ import annotations

def vercel_build_smoke_standard() -> dict:
    return {
        "status": "vercel_smoke_ready",
        "checks": ["npm_build", "route_health", "api_status", "env_contract", "metadata"],
    }

def public_beta_deploy_smoke_runbook() -> dict:
    return {
        "status": "deploy_smoke_ready",
        "steps": ["build", "open_public_beta", "submit_feedback_test", "submit_pilot_test", "open_trust_wall", "capture_proof"],
    }
