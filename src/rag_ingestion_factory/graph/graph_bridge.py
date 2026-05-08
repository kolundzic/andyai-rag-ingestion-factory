from __future__ import annotations

from .knowledgeblock_nodes import block_node
from .knowledgeblock_edges import evidence_edge


def graph_from_blocks(blocks: list[dict]) -> dict:
    nodes = [block_node(block) for block in blocks]
    edges = [evidence_edge(block["id"], block.get("source_document_id", "unknown")) for block in blocks]
    return {"nodes": nodes, "edges": edges}
