from __future__ import annotations

def repo_graph_status() -> dict:
    return {
        "status": "repo_graph_pipeline_ready",
        "pipeline": ["source", "parse", "extract_entities", "extract_relations", "build_graph", "hybrid_retrieval"],
    }

def module_dependency_graph() -> dict:
    return {
        "status": "module_dependency_graph_ready",
        "nodes": ["module", "service", "endpoint", "schema", "test"],
        "edges": ["imports", "depends_on", "tests", "verifies"],
    }
