from __future__ import annotations


def build_v13_knowledge_graph_status() -> dict:
    return {
        "product": "AndyAI Knowledge Factory",
        "site": "knowledgefactory.andyai.ai",
        "version": "13.0.0",
        "release": "Knowledge Graph & LLM Wiki Compiler Layer",
        "formula": {
            "RAG": "Retrieval Layer",
            "LLM Wiki": "Persistent Synthesis Layer",
            "Knowledge Graph": "Relationship / Structure Layer",
            "Evidence Pack": "Trust Layer",
            "Human Approval": "Governance Layer",
            "Visual Atlas": "Human Understanding Layer",
        },
        "canonical_rule": "Do not stop at retrieval. Compile knowledge.",
    }
