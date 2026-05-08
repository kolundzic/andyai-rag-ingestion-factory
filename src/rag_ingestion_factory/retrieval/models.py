from __future__ import annotations
from dataclasses import dataclass

@dataclass(frozen=True)
class RetrievalCandidate:
    chunk_id: str
    document_id: str
    file_name: str
    page_start: int
    page_end: int
    section_title: str
    text: str
    score: float
    retrieval_method: str
