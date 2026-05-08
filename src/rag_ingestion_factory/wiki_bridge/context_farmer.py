from __future__ import annotations


def context_farmer_cycle() -> list[str]:
    return ["watch_sources", "detect_new_material", "ingest_parse", "distill_knowledgeblocks", "update_wiki_graph", "lint_health_check"]
