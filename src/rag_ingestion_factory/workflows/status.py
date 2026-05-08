from __future__ import annotations


def build_v15_workflow_status() -> dict:
    return {
        "product": "AndyAI Knowledge Factory",
        "site": "knowledgefactory.andyai.ai",
        "version": "15.0.0",
        "release": "Knowledge Workflows & Agentic Compilation",
        "workflow": ["compile", "review", "approve", "export", "reuse"],
        "canonical_rule": "Agents may compile knowledge. Humans approve durable knowledge. Evidence remains attached.",
    }
