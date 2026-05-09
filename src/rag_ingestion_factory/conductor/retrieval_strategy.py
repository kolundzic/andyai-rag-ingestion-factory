from __future__ import annotations

def choose_retrieval_strategy(query: str) -> dict:
    text = query.lower()
    if "graph" in text and "freshness" in text:
        strategy = "graph_plus_source_freshness"
    elif "graph" in text:
        strategy = "knowledge_graph_lookup"
    elif "wiki" in text:
        strategy = "llm_wiki_lookup"
    elif "source" in text or "freshness" in text:
        strategy = "source_freshness_check"
    else:
        strategy = "vector_retrieval"
    return {"query": query, "strategy": strategy, "status": "selected"}
