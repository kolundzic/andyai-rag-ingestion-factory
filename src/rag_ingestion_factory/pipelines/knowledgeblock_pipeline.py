from __future__ import annotations

from .stage_runner import run_stage

STAGES = ["parse", "chunk", "extract", "cluster", "merge", "govern", "evidence", "review", "export", "index", "compile_wiki", "compile_graph", "quality_report"]


def run_knowledgeblock_pipeline() -> dict:
    return {"run_id": "kb-production-demo", "stages": [run_stage(stage) for stage in STAGES]}
