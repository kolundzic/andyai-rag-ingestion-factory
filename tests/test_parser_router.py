from pathlib import Path

from rag_ingestion_factory.core.registry import register_document
from rag_ingestion_factory.adapters.router import parse_document


def test_parser_router_supports_txt(tmp_path: Path):
    p = tmp_path / "demo.txt"
    p.write_text("Page 1\nHello router.", encoding="utf-8")
    doc = register_document(p)

    pages = parse_document(doc)

    assert len(pages) == 1
    assert pages[0].page_number == 1
    assert "Hello router" in pages[0].text
