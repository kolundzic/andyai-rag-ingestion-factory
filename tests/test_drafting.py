from rag_ingestion_factory.drafting.from_evidence import draft_markdown_from_evidence

def test_draft_markdown_from_evidence():
    pack = {
        "query": "demo",
        "answer_context": "Evidence text.",
        "citations": [
            {
                "file_name": "demo.txt",
                "page_start": 1,
                "page_end": 1,
                "section_title": "Demo",
                "chunk_id": "chk_1",
            }
        ],
    }
    draft = draft_markdown_from_evidence(pack)
    assert "# Evidence-Based Draft" in draft
    assert "chk_1" in draft
