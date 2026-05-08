from __future__ import annotations

from datetime import datetime, timezone

from rag_ingestion_factory.core.hashing import sha256_text
from rag_ingestion_factory.core.models import ChunkRecord, PageBlock


def stable_chunk_id(document_id: str, page_start: int, page_end: int, chunk_index: int, text: str) -> str:
    digest = sha256_text(f"{document_id}:{page_start}:{page_end}:{chunk_index}:{text}")
    return f"chk_{digest[:24]}"


def chunk_page_blocks(
    pages: list[PageBlock],
    max_chars: int = 2400,
    overlap_chars: int = 250,
) -> list[ChunkRecord]:
    chunks: list[ChunkRecord] = []
    chunk_index = 0
    created_at = datetime.now(timezone.utc).isoformat()

    for page in pages:
        text = page.text.strip()
        if not text:
            continue

        start = 0
        while start < len(text):
            end = min(start + max_chars, len(text))
            chunk_text = text[start:end].strip()

            if chunk_text:
                chunk_id = stable_chunk_id(
                    page.document_id,
                    page.page_number,
                    page.page_number,
                    chunk_index,
                    chunk_text,
                )
                chunks.append(
                    ChunkRecord(
                        chunk_id=chunk_id,
                        document_id=page.document_id,
                        file_name=page.file_name,
                        page_start=page.page_number,
                        page_end=page.page_number,
                        section_title=page.section_title,
                        chunk_index=chunk_index,
                        text=chunk_text,
                        text_hash=sha256_text(chunk_text),
                        created_at=created_at,
                    )
                )
                chunk_index += 1

            if end >= len(text):
                break

            start = max(0, end - overlap_chars)

    return chunks
