from rag_ingestion_factory.knowledgeblocks.governance import attach_governance


def test_attach_governance():
    block = attach_governance({"id":"kb"}, ["internal", "unknown"], "medium")
    assert block["governance_tags"] == ["internal"]
