from __future__ import annotations

import json
from dataclasses import asdict
from pathlib import Path
from typing import Any

from rag_ingestion_factory.context_board.board import ContextBoard


def save_context_board(board: ContextBoard, output_dir: str | Path) -> Path:
    out = Path(output_dir)
    out.mkdir(parents=True, exist_ok=True)
    path = out / f"{board.board_id}.json"
    path.write_text(json.dumps(asdict(board), ensure_ascii=False, indent=2, sort_keys=True), encoding="utf-8")
    return path


def load_context_board(path: str | Path) -> dict[str, Any]:
    return json.loads(Path(path).read_text(encoding="utf-8"))
