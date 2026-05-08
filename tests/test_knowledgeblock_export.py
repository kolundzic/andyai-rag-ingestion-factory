from rag_ingestion_factory.knowledgeblocks.export import to_jsonl
from rag_ingestion_factory.knowledgeblocks.markdown_export import to_markdown
from rag_ingestion_factory.knowledgeblocks.vector_payload import to_vector_payload


def test_exports():
    block = {"id":"kb","question":"Q","answer":"A","status":"approved"}
    assert to_jsonl([block])
    assert "# Q" in to_markdown(block)
    assert to_vector_payload(block)["id"] == "kb"
