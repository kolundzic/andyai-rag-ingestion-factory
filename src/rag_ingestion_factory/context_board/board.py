from __future__ import annotations

from dataclasses import dataclass, asdict
from typing import Any
import hashlib


@dataclass(frozen=True)
class EvidenceItem:
    chunk_id: str
    file_name: str
    page_start: int
    page_end: int
    section_title: str
    score: float


@dataclass(frozen=True)
class ContextBoard:
    board_id: str
    query: str
    status: str
    evidence_items: list[EvidenceItem]
    operator_notes: str = ""


def make_board_id(query: str) -> str:
    digest = hashlib.sha256(query.encode("utf-8")).hexdigest()[:16]
    return f"ctx_{digest}"


def context_board_from_evidence_pack(evidence_pack: dict[str, Any], status: str = "draft") -> ContextBoard:
    query = str(evidence_pack.get("query", ""))
    items = [
        EvidenceItem(
            chunk_id=str(c.get("chunk_id", "")),
            file_name=str(c.get("file_name", "")),
            page_start=int(c.get("page_start", 0)),
            page_end=int(c.get("page_end", 0)),
            section_title=str(c.get("section_title", "")),
            score=float(c.get("score", 0.0)),
        )
        for c in evidence_pack.get("citations", [])
    ]
    return ContextBoard(
        board_id=make_board_id(query),
        query=query,
        status=status,
        evidence_items=items,
    )


def context_board_to_dict(board: ContextBoard) -> dict[str, Any]:
    return asdict(board)
