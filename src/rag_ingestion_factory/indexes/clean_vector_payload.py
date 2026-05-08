from __future__ import annotations


def make_clean_vector_payload(block: dict) -> dict:
    return {"id": block["id"], "text": f"{block.get('question','')} {block.get('answer','')}", "metadata": {"status": block.get("status"), "human_review_state": block.get("human_review_state")}}
