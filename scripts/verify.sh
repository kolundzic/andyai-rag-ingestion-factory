#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v4.3.0 — Context Board Persistence"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from pathlib import Path
from rag_ingestion_factory.context_board.board import context_board_from_evidence_pack
from rag_ingestion_factory.context_board.persistence import save_context_board, load_context_board

pack = {
    "query": "demo query",
    "citations": [{"chunk_id": "chk_1", "file_name": "demo.txt", "page_start": 1, "page_end": 1, "section_title": "Demo", "score": 0.9}]
}
board = context_board_from_evidence_pack(pack)
path = save_context_board(board, "examples/output/context_boards")
loaded = load_context_board(path)
assert loaded["board_id"] == board.board_id
assert loaded["evidence_items"][0]["chunk_id"] == "chk_1"
print("🟢 Context Board persistence smoke test passed")
PY

test -f docs/29-context-persistence/CONTEXT_BOARD_PERSISTENCE_v4_3.md
test -f src/rag_ingestion_factory/context_board/persistence.py

echo "🟢 VERIFY PASSED"
