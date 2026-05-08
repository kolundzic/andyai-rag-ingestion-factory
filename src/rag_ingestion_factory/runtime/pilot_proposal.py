from __future__ import annotations


def generate_pilot_proposal(organization: str) -> dict:
    return {
        "title": f"AndyAI Knowledge Factory — Pilot Proposal for {organization}",
        "scope": ["controlled document set", "evidence-backed Q&A", "admin review"],
        "success_metrics": ["source traceability", "time saved", "approved knowledge outputs"],
        "next_step": "Schedule pilot proposal meeting",
    }
