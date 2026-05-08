from __future__ import annotations


def build_v14_visual_atlas_status() -> dict:
    return {
        "product": "AndyAI Knowledge Factory",
        "site": "knowledgefactory.andyai.ai",
        "version": "14.0.0",
        "release": "Visual Atlas & Graph Explorer",
        "views": [
            "domain_map",
            "topic_map",
            "entity_network",
            "claim_network",
            "evidence_path",
            "approval_overlay",
            "contradiction_map",
        ],
        "canonical_rule": "Structured knowledge should be visible, not only searchable.",
    }
