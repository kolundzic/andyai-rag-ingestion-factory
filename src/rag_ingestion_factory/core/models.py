from __future__ import annotations

from dataclasses import dataclass, asdict
from typing import Any
import json


@dataclass(frozen=True)
class DocumentRecord:
    document_id: str
    file_name: str
    file_hash: str
    source_path: str
    status: str


@dataclass(frozen=True)
class PageBlock:
    document_id: str
    file_name: str
    page_number: int
    text: str
    section_title: str = ""


@dataclass(frozen=True)
class ChunkRecord:
    chunk_id: str
    document_id: str
    file_name: str
    page_start: int
    page_end: int
    section_title: str
    chunk_index: int
    text: str
    text_hash: str
    created_at: str


@dataclass(frozen=True)
class CitationRecord:
    document_id: str
    file_name: str
    page_start: int
    page_end: int
    section_title: str
    chunk_id: str
    retrieval_method: str
    score: float


def to_json_line(obj: Any) -> str:
    return json.dumps(asdict(obj), ensure_ascii=False, sort_keys=True)
