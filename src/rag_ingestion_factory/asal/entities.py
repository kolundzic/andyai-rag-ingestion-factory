from __future__ import annotations

def structural_entity(entity_type: str, name: str, source: str | None = None) -> dict:
    return {
        "type": entity_type,
        "name": name,
        "source": source,
        "status": "entity_ready",
        "allowed_types": ["function", "class", "module", "endpoint", "service", "schema", "test", "doc", "decision"],
    }
