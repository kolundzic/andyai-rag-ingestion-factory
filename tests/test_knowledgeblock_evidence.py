from rag_ingestion_factory.knowledgeblocks.evidence import attach_evidence


def test_attach_evidence():
    block = attach_evidence({"id":"kb"}, [{"document_id":"doc"}])
    assert block["has_evidence"] is True
