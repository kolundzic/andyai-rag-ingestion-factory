from dataclasses import dataclass
import hashlib


@dataclass(frozen=True)
class Chunk:
    chunk_id: str
    document_id: str
    text: str
    page_start: int
    page_end: int
    section_title: str


def stable_chunk_id(document_id: str, text: str, page_start: int, page_end: int) -> str:
    raw = f"{document_id}:{page_start}:{page_end}:{text}".encode("utf-8")
    return "chk_" + hashlib.sha256(raw).hexdigest()[:24]


def simple_page_chunk(document_id: str, text: str, page: int, section_title: str = "") -> Chunk:
    return Chunk(
        chunk_id=stable_chunk_id(document_id, text, page, page),
        document_id=document_id,
        text=text,
        page_start=page,
        page_end=page,
        section_title=section_title,
    )
