from __future__ import annotations

COMMANDS = ["extract_candidates", "cluster_duplicates", "merge_canonical", "attach_governance", "attach_evidence", "queue_review", "export_blocks", "compile_wiki", "compile_graph"]


def command_status() -> dict:
    return {"status": "ready", "commands": COMMANDS}
