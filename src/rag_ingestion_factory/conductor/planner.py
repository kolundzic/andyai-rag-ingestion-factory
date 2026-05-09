from __future__ import annotations

def conductor_plan(user_question: str) -> dict:
    return {
        "question": user_question,
        "status": "planned",
        "steps": ["classify_intent", "choose_strategy", "assign_worker", "apply_context_policy", "verify", "approve", "save_evidence"],
    }
