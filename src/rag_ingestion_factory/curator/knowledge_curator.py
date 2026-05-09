from __future__ import annotations

CURATOR_CHECKS = [
    "old_chunks", "duplicates", "unclear_versions", "weak_sources",
    "stale_wiki_pages", "broken_graph_edges", "low_evidence_quality", "unapproved_knowledgeblocks",
]

def knowledge_curator_status() -> dict:
    return {"version": "v30.2.0", "status": "knowledge-curator-standard-ready", "checks": CURATOR_CHECKS}

def build_curator_report(target: str, issue_type: str, severity: str = "medium") -> dict:
    return {
        "report_id": f"curator-{target}-{issue_type}",
        "scope": "knowledge_factory",
        "target": target,
        "issue_type": issue_type,
        "severity": severity,
        "evidence": [],
        "suggested_action": "route_to_review",
        "human_review_priority": severity,
    }
