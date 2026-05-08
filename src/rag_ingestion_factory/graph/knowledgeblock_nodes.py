from __future__ import annotations


def block_node(block: dict) -> dict:
    return {"id": block["id"], "type": "KnowledgeBlock", "label": block.get("question", block["id"])}
