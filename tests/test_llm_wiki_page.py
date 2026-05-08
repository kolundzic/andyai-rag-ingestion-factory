from rag_ingestion_factory.llm_wiki.page import wiki_page_from_claim

def test_wiki_page_from_claim():
    page = wiki_page_from_claim("Permission-Aware Retrieval", "claim_1", ("chunk_1",))
    assert page.page_type == "claim_page"
    assert "claim_1" in page.claim_ids
