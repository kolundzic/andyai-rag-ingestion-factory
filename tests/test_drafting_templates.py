from rag_ingestion_factory.drafting.templates import render_template_draft

def test_render_template_draft():
    pack = {"query": "q", "answer_context": "ctx", "citations": [{"file_name": "f", "page_start": 1, "page_end": 1, "section_title": "s", "chunk_id": "c"}]}
    draft = render_template_draft(pack, "technical_summary")
    assert "Technical Summary" in draft
    assert "`c`" in draft
