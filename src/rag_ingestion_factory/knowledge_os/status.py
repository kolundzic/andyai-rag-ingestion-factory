from __future__ import annotations


def build_knowledge_os_status() -> dict:
    return {
        "repo": "andyai-rag-ingestion-factory",
        "version": "10.0.0",
        "level": "sovereign-knowledge-os",
        "core_layers": [
            "ingestion",
            "metadata",
            "hybrid_retrieval",
            "permission_aware_retrieval",
            "context_board",
            "evidence_to_draft",
            "external_gateway",
            "approval_workflow",
            "signed_evidence",
            "evaluation",
            "runtime_service",
            "multitenant_governance",
            "observability",
            "release_factory",
        ],
    }
