from __future__ import annotations


def build_live_qdrant_pipeline_status() -> dict:
    return {
        "product": "AndyAI Knowledge Factory",
        "site": "knowledgefactory.andyai.ai",
        "version": "12.0.0",
        "pipeline": "live-qdrant-ready",
        "required_services": ["qdrant", "postgres", "supabase"],
        "flow": [
            "embedding_provider",
            "qdrant_collection",
            "payload_permissions",
            "vector_search",
            "hybrid_merge",
            "evidence_pack",
        ],
        "rule": "Permissions shape vector retrieval before context reaches the model.",
    }
