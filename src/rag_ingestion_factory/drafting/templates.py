from __future__ import annotations

from typing import Any


DEFAULT_TEMPLATES = {
    "executive_brief": "Executive Brief",
    "technical_summary": "Technical Summary",
    "operator_report": "Operator Report",
    "client_explanation": "Client Explanation",
}


def render_template_draft(evidence_pack: dict[str, Any], template_name: str = "executive_brief") -> str:
    title = DEFAULT_TEMPLATES.get(template_name, "Evidence-Based Draft")
    query = evidence_pack.get("query", "")
    answer_context = evidence_pack.get("answer_context", "")
    citations = evidence_pack.get("citations", [])

    citation_lines = [
        f"- {c.get('file_name')} pp.{c.get('page_start')}-{c.get('page_end')} "
        f"| {c.get('section_title')} | `{c.get('chunk_id')}`"
        for c in citations
    ]

    return "\n".join(
        [
            f"# {title}",
            "",
            "## Purpose",
            "",
            f"Evidence-grounded draft for query: **{query}**",
            "",
            "## Main Evidence",
            "",
            answer_context or "_No evidence context available._",
            "",
            "## Citations",
            "",
            "\n".join(citation_lines) if citation_lines else "_No citations available._",
            "",
            "## Human Review Required",
            "",
            "This draft must be reviewed before external use.",
            "",
        ]
    )
