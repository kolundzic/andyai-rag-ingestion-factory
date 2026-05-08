from rag_ingestion_factory.wiki.knowledgeblock_compiler import compile_topic_page


def test_compile_topic_page():
    page = compile_topic_page("Topic", [{"question":"Q","answer":"A"}])
    assert "# Topic" in page
    assert "## Q" in page
