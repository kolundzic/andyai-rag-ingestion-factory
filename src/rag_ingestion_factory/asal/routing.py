from __future__ import annotations

def hybrid_rag_graph_routing_policy(question: str) -> dict:
    q = question.lower()
    graph_terms = ["calls", "imports", "depends", "path", "impact", "affected", "test", "function", "module", "edge", "graph"]
    route = "graph_traversal" if any(term in q for term in graph_terms) else "semantic_rag"
    return {
        "status": "routing_ready",
        "question": question,
        "route": route,
        "rule": "use graph traversal for structural dependency questions; use semantic RAG for explanatory text questions",
    }
