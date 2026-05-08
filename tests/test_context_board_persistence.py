from rag_ingestion_factory.context_board.board import context_board_from_evidence_pack
from rag_ingestion_factory.context_board.persistence import save_context_board, load_context_board

def test_context_board_persistence(tmp_path):
    pack = {"query": "demo", "citations": [{"chunk_id": "c1", "file_name": "f.txt", "page_start": 1, "page_end": 1, "section_title": "s", "score": 1.0}]}
    board = context_board_from_evidence_pack(pack)
    path = save_context_board(board, tmp_path)
    loaded = load_context_board(path)
    assert loaded["board_id"] == board.board_id
