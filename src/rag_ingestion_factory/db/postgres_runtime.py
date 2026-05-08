from __future__ import annotations

from dataclasses import asdict
from typing import Any

from rag_ingestion_factory.core.models import DocumentRecord, ChunkRecord


def document_insert_statement(document: DocumentRecord) -> tuple[str, dict[str, Any]]:
    return (
        """
        INSERT INTO documents (document_id, file_name, file_hash, source_path, status)
        VALUES (%(document_id)s, %(file_name)s, %(file_hash)s, %(source_path)s, %(status)s)
        ON CONFLICT (document_id) DO UPDATE SET
          file_name = EXCLUDED.file_name,
          file_hash = EXCLUDED.file_hash,
          source_path = EXCLUDED.source_path,
          status = EXCLUDED.status
        """,
        asdict(document),
    )


def chunk_insert_statement(chunk: ChunkRecord) -> tuple[str, dict[str, Any]]:
    return (
        """
        INSERT INTO chunks (chunk_id, document_id, file_name, page_start, page_end, section_title, chunk_index, text_hash, text)
        VALUES (%(chunk_id)s, %(document_id)s, %(file_name)s, %(page_start)s, %(page_end)s, %(section_title)s, %(chunk_index)s, %(text_hash)s, %(text)s)
        ON CONFLICT (chunk_id) DO UPDATE SET
          text_hash = EXCLUDED.text_hash,
          text = EXCLUDED.text
        """,
        asdict(chunk),
    )
