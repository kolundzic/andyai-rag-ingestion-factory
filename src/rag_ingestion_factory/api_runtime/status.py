from __future__ import annotations


def build_runtime_api_status() -> dict:
    return {
        "product": "AndyAI Knowledge Factory",
        "site": "knowledgefactory.andyai.ai",
        "api_version": "11.0.0",
        "routes": [
            "/api/health",
            "/api/runtime/status",
            "/api/playground/demo",
            "/api/evidence/demo",
            "/api/context-board/demo",
            "/api/qdrant/demo",
        ],
        "rule": "API endpoints must return evidence metadata, not only generated text.",
    }
