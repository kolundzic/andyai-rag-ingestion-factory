from __future__ import annotations

from pathlib import Path

from rag_ingestion_factory.core.models import DocumentRecord, PageBlock


def parse_text_file(document: DocumentRecord) -> list[PageBlock]:
    path = Path(document.source_path)
    raw = path.read_text(encoding="utf-8", errors="replace")

    pages: list[PageBlock] = []
    current_page = 1
    current_lines: list[str] = []
    section_title = ""

    for line in raw.splitlines():
        stripped = line.strip()

        if stripped.startswith("#"):
            section_title = stripped.lstrip("#").strip()

        if stripped.lower().startswith("page "):
            if current_lines:
                pages.append(
                    PageBlock(
                        document_id=document.document_id,
                        file_name=document.file_name,
                        page_number=current_page,
                        text="\n".join(current_lines).strip(),
                        section_title=section_title,
                    )
                )
                current_lines = []
            try:
                current_page = int(stripped.split()[1])
            except Exception:
                current_page += 1
            continue

        current_lines.append(line)

    if current_lines:
        pages.append(
            PageBlock(
                document_id=document.document_id,
                file_name=document.file_name,
                page_number=current_page,
                text="\n".join(current_lines).strip(),
                section_title=section_title,
            )
        )

    return [p for p in pages if p.text]
