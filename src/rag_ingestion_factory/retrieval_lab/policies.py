from __future__ import annotations


def strict_context_answer(context: str, answer: str) -> dict:
    if not context.strip():
        return {
            "answer": "Not found in context.",
            "trusted": False,
            "policy": "strict_context_answering",
        }
    return {
        "answer": answer,
        "trusted": True,
        "policy": "strict_context_answering",
    }
