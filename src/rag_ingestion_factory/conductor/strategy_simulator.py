from __future__ import annotations

def retrieval_strategy_simulation(query: str) -> dict:
    q = query.lower()
    if "graph" in q and "freshness" in q:
        strategy = "graph_plus_source_freshness"
    elif "graph" in q:
        strategy = "knowledge_graph_lookup"
    elif "wiki" in q:
        strategy = "llm_wiki_lookup"
    else:
        strategy = "vector_retrieval"
    return {"query": query, "strategy": strategy, "status": "simulated"}
