from __future__ import annotations


def source_anchor(document_id: str, page: int | None = None) -> dict:
    return {"document_id": document_id, "page": page}
