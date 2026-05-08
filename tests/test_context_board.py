from rag_ingestion_factory.context_board.board import context_board_from_evidence_pack

def test_context_board_from_evidence_pack():
    pack = {
        "query": "demo",
        "citations": [
            {
                "chunk_id": "chk_1",
                "file_name": "demo.txt",
                "page_start": 1,
                "page_end": 1,
                "section_title": "Demo",
                "score": 0.9,
            }
        ],
    }
    board = context_board_from_evidence_pack(pack)
    assert board.board_id.startswith("ctx_")
    assert board.evidence_items[0].chunk_id == "chk_1"
