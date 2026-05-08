from __future__ import annotations


def query_saveback_event(question: str, proposed_update: str) -> dict:
    return {"question": question, "proposed_update": proposed_update, "status": "needs_review"}
