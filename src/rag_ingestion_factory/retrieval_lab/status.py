from __future__ import annotations

from rag_ingestion_factory.retrieval_lab.models import VectorAdapterCandidate


def build_v16_3_retrieval_lab_status() -> dict:
    adapters = [
        VectorAdapterCandidate(
            adapter_id="adapter_turbovec_local",
            backend="turbovec",
            capabilities=("local_vector_search", "self_hosted_lab", "semantic_retrieval"),
            self_hosted=True,
            permission_filtering=False,
            evidence_metadata_required=True,
        ),
        VectorAdapterCandidate(
            adapter_id="adapter_qdrant_payload",
            backend="qdrant",
            capabilities=("vector_search", "payload_filtering", "permission_aware_retrieval"),
            self_hosted=True,
            permission_filtering=True,
            evidence_metadata_required=True,
        ),
    ]
    return {
        "product": "AndyAI Knowledge Factory",
        "site": "knowledgefactory.andyai.ai",
        "version": "16.3.0",
        "release": "Self-Hosted Retrieval Lab Signal",
        "adapters": [adapter.to_dict() for adapter in adapters],
        "canonical_sentence": "RAG finds fragments. Knowledge Factory turns them into proven, linked, approved knowledge.",
    }
