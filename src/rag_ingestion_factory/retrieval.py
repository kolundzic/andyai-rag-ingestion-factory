from dataclasses import dataclass


@dataclass(frozen=True)
class RetrievalCandidate:
    chunk_id: str
    document_id: str
    file_name: str
    page_start: int
    page_end: int
    section_title: str
    score: float
    retrieval_method: str


def build_citation(candidate: RetrievalCandidate) -> str:
    return f"{candidate.file_name}, pages {candidate.page_start}-{candidate.page_end}, section: {candidate.section_title}, chunk: {candidate.chunk_id}"
