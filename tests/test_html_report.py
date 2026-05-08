from pathlib import Path
from rag_ingestion_factory.reports.html_report import write_html_report

def test_write_html_report(tmp_path: Path):
    out = tmp_path / "report.html"
    write_html_report(out, {"readiness": {"score": 100, "level": "ok"}, "manifest": {}, "evidence_pack": {"citations": []}})
    assert out.exists()
    assert "AndyAI RAG Ingestion Factory" in out.read_text(encoding="utf-8")
