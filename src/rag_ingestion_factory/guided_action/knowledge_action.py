from __future__ import annotations

def guided_knowledge_action(intent: str, assigned_agent: str = "knowledge_curator") -> dict:
    return {
        "action_id": "guided-knowledge-action-demo",
        "intent": intent,
        "status": "needs_human_approval",
        "assigned_agent": assigned_agent,
        "evidence_trail": [],
        "human_approval": "pending",
        "verified_outcome": "pending",
    }
