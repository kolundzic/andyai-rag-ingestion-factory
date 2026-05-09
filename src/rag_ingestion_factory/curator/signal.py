from __future__ import annotations

def hermes_signal_status() -> dict:
    return {
        "version": "v30.1.0",
        "status": "hermes-signal-mapped",
        "canon": "Hermes cleans skills. Knowledge Factory cleans knowledge.",
        "curator_targets": [
            "old_chunks", "duplicates", "unclear_versions", "weak_sources",
            "dead_memory", "stale_wiki_pages", "broken_graph_edges", "low_evidence_quality"
        ],
    }
