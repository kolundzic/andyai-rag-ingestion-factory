from __future__ import annotations

from typing import Any


def draft_markdown_from_evidence(evidence_pack: dict[str, Any], title: str = "Evidence-Based Draft") -> str:
    query = evidence_pack.get("query", "")
    context = evidence_pack.get("answer_context", "")
    citations = evidence_pack.get("citations", [])

    citation_lines = []
    for i, citation in enumerate(citations, start=1):
        citation_lines.append(
            f"{i}. {citation.get('file_name')} — pages "
            f"{citation.get('page_start')}-{citation.get('page_end')}, "
            f"section: {citation.get('section_title')}, "
            f"chunk: `{citation.get('chunk_id')}`"
        )

    return "\n".join(
        [
            f"# {title}",
            "",
            "## Query",
            "",
            str(query),
            "",
            "## Evidence-Based Working Draft",
            "",
            "This draft is generated only from the provided evidence pack.",
            "",
            context if context else "_No answer context available._",
            "",
            "## Citations",
            "",
            "\n".join(citation_lines) if citation_lines else "_No citations available._",
            "",
            "## Governance Note",
            "",
            "Draft must be reviewed by a human before external use.",
            "",
        ]
    )
