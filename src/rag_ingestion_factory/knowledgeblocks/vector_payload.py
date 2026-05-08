from __future__ import annotations


def to_vector_payload(block: dict) -> dict:
    return {"id": block["id"], "text": f"{block.get('question','')} {block.get('answer','')}", "metadata": {"status": block.get("status")}}
