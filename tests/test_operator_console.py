from pathlib import Path
from rag_ingestion_factory.operator.console import run_operator_console_demo

def test_operator_console_demo(tmp_path: Path):
    src = tmp_path / "demo.txt"
    src.write_text("Page 1\nThe ingestion pipeline prepares chunks, indexes, and evidence.", encoding="utf-8")
    out = tmp_path / "operator"
    report = run_operator_console_demo(src, "What does the ingestion pipeline prepare?", out)

    assert report["readiness"]["score"] >= 90
    assert (out / "operator_console_report.json").exists()
    assert (out / "operator_console_report.html").exists()
    assert (out / "release_evidence_bundle.json").exists()
