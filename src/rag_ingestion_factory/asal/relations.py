from __future__ import annotations

def structural_relation(source: str, target: str, relation: str) -> dict:
    return {
        "source": source,
        "target": target,
        "relation": relation,
        "status": "relation_ready",
        "allowed_relations": ["calls", "imports", "inherits", "implements", "depends_on", "tests", "documents", "changes", "breaks", "verifies", "affects"],
    }
