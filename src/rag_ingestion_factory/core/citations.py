from __future__ import annotations

from rag_ingestion_factory.core.models import ChunkRecord, CitationRecord


def citation_from_chunk(
    chunk: ChunkRecord,
    retrieval_method: str = "local-demo",
    score: float = 1.0,
) -> CitationRecord:
    return CitationRecord(
        document_id=chunk.document_id,
        file_name=chunk.file_name,
        page_start=chunk.page_start,
        page_end=chunk.page_end,
        section_title=chunk.section_title,
        chunk_id=chunk.chunk_id,
        retrieval_method=retrieval_method,
        score=score,
    )


def format_citation(citation: CitationRecord) -> str:
    return (
        f"{citation.file_name}, pages {citation.page_start}-{citation.page_end}, "
        f"section '{citation.section_title}', chunk {citation.chunk_id}, "
        f"method={citation.retrieval_method}, score={citation.score:.2f}"
    )
