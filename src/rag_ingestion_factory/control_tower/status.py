from __future__ import annotations

from rag_ingestion_factory.control_tower.proof_bundle import build_v16_production_proof_bundle
from rag_ingestion_factory.control_tower.readiness import calculate_deploy_readiness


def build_v16_control_tower_status() -> dict:
    bundle = build_v16_production_proof_bundle()
    checks = list(bundle.gate_results)
    readiness = calculate_deploy_readiness(checks)
    return {
        "product": "AndyAI Knowledge Factory",
        "site": "knowledgefactory.andyai.ai",
        "version": "16.0.0",
        "release": "Production Deploy Control Tower",
        "readiness": readiness,
        "proof_bundle": bundle.to_dict(),
        "canonical_rule": "No production deploy without readiness gates, rollback path, and proof bundle.",
    }
