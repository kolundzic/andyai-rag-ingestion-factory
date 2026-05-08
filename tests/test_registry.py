from pathlib import Path

from rag_ingestion_factory.core.registry import register_document


def test_register_document(tmp_path: Path):
    p = tmp_path / "demo.txt"
    p.write_text("hello", encoding="utf-8")

    doc = register_document(p)

    assert doc.document_id.startswith("doc_")
    assert doc.file_name == "demo.txt"
    assert doc.file_hash
    assert doc.status == "registered"
