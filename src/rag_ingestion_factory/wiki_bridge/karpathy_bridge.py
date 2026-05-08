from __future__ import annotations


def karpathy_bridge_status() -> dict:
    return {
        "version": "v25.2.0",
        "status": "karpathy-llm-wiki-bridge-ready",
        "canon": "Knowledge Factory produces KnowledgeBlocks. LLM Wiki compiles KnowledgeBlocks into living pages.",
        "layers": ["raw", "knowledgeblocks", "wiki", "query", "save_back", "lint", "health_check"],
    }
