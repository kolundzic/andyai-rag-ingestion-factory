from __future__ import annotations

from html import escape
from pathlib import Path
from typing import Any


def write_html_report(path: str | Path, payload: dict[str, Any]) -> Path:
    output = Path(path)
    output.parent.mkdir(parents=True, exist_ok=True)

    readiness = payload.get("readiness", {})
    evidence = payload.get("evidence_pack", {})
    manifest = payload.get("manifest", {})
    citations = evidence.get("citations", [])

    citation_items = "\n".join(
        [
            f"<li><strong>{escape(c.get('file_name', 'unknown'))}</strong> "
            f"pp.{c.get('page_start')}-{c.get('page_end')} "
            f"<code>{escape(c.get('chunk_id', ''))}</code> "
            f"score={c.get('score')}</li>"
            for c in citations
        ]
    )

    html = f"""<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>AndyAI RAG Ingestion Factory — Operator Report</title>
  <style>
    body {{ font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif; margin: 40px; line-height: 1.5; }}
    .badge {{ display: inline-block; padding: 6px 10px; border-radius: 999px; background: #111; color: #fff; }}
    .card {{ border: 1px solid #ddd; border-radius: 14px; padding: 18px; margin: 18px 0; }}
    code {{ background: #f3f3f3; padding: 2px 5px; border-radius: 6px; }}
    h1, h2 {{ letter-spacing: -0.02em; }}
  </style>
</head>
<body>
  <h1>🧠 AndyAI RAG Ingestion Factory</h1>
  <p class="badge">Operator Evidence Console v4.0.0</p>

  <div class="card">
    <h2>Readiness</h2>
    <p><strong>Score:</strong> {readiness.get("score")} / 100</p>
    <p><strong>Level:</strong> {escape(str(readiness.get("level")))}</p>
  </div>

  <div class="card">
    <h2>Ingestion Manifest</h2>
    <p><strong>Status:</strong> {escape(str(manifest.get("status")))}</p>
    <p><strong>File:</strong> {escape(str(manifest.get("file_name")))}</p>
    <p><strong>Chunks:</strong> {manifest.get("chunks_count")}</p>
    <p><strong>Pipeline:</strong> {escape(str(manifest.get("pipeline_version")))}</p>
  </div>

  <div class="card">
    <h2>Citations</h2>
    <ul>{citation_items}</ul>
  </div>

  <div class="card">
    <h2>Evidence Policy</h2>
    <p>{escape(str(evidence.get("evidence_policy")))}</p>
  </div>
</body>
</html>
"""
    output.write_text(html, encoding="utf-8")
    return output
