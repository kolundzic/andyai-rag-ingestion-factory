from rag_ingestion_factory.chunking import simple_page_chunk


def test_simple_page_chunk_has_stable_id():
    a = simple_page_chunk("doc_1", "hello world", 1, "Intro")
    b = simple_page_chunk("doc_1", "hello world", 1, "Intro")
    assert a.chunk_id == b.chunk_id
    assert a.page_start == 1
    assert a.page_end == 1
