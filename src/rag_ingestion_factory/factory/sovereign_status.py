from __future__ import annotations


def build_sovereign_factory_status() -> dict:
    return {
        "repo": "andyai-rag-ingestion-factory",
        "version": "5.0.0",
        "factory_level": "sovereign-enterprise-rag-factory",
        "layers": [
            "document_ingestion",
            "pdf_parser_adapter",
            "page_aware_chunking",
            "postgres_metadata_schema",
            "qdrant_vector_adapter_contract",
            "hybrid_retrieval",
            "permission_aware_retrieval",
            "qdrant_payload_permission_filters",
            "evidence_pack",
            "context_board",
            "context_board_persistence",
            "evidence_to_draft_templates",
            "external_service_gateway",
            "operator_evidence_console",
            "governance_audit",
            "production_bridge",
        ],
        "canonical_formula": [
            "Data stays inside.",
            "Permissions shape retrieval.",
            "Evidence becomes context.",
            "Context becomes draft.",
            "Draft remains cited.",
            "Agents carry proof.",
            "Humans approve external use.",
        ],
    }
