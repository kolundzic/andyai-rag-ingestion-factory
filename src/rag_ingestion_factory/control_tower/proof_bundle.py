from __future__ import annotations

from rag_ingestion_factory.control_tower.models import ProductionProofBundle
from rag_ingestion_factory.control_tower.readiness import build_default_v16_checks


def build_v16_production_proof_bundle() -> ProductionProofBundle:
    checks = tuple(build_default_v16_checks())
    return ProductionProofBundle(
        release_version="v16.0.0",
        product_site="knowledgefactory.andyai.ai",
        gate_results=checks,
        rollback_path="git checkout v15.0.0",
        operator_notes="Production Control Tower introduced. Live deploy remains gated.",
    )
