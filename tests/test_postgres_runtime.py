from rag_ingestion_factory.core.models import DocumentRecord
from rag_ingestion_factory.db.postgres_runtime import document_insert_statement

def test_document_insert_statement():
    doc = DocumentRecord("doc_1", "file.txt", "hash", "/tmp/file.txt", "registered")
    sql, params = document_insert_statement(doc)
    assert "INSERT INTO documents" in sql
    assert params["document_id"] == "doc_1"
