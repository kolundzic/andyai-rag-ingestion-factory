from __future__ import annotations

def graph_hygiene_report(nodes: list[dict], edges: list[dict]) -> dict:
    node_ids = {n.get("id") for n in nodes}
    connected = set()
    broken_edges = []
    for e in edges:
        source = e.get("source")
        target = e.get("target")
        if source not in node_ids or target not in node_ids:
            broken_edges.append(e)
        else:
            connected.add(source)
            connected.add(target)
    orphan_nodes = [n.get("id") for n in nodes if n.get("id") not in connected]
    uncited_claims = [n.get("id") for n in nodes if n.get("type") == "claim" and not n.get("evidence")]
    return {"orphan_nodes": orphan_nodes, "broken_edges": broken_edges, "uncited_claims": uncited_claims, "recommended_actions": ["review_orphans", "repair_edges", "attach_evidence"]}
