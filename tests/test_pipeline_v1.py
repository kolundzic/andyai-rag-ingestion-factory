from pathlib import Path

from rag_ingestion_factory.core.pipeline_v1 import ingest_local_file


def test_ingest_local_file(tmp_path: Path):
    source = tmp_path / "demo.txt"
    source.write_text("Page 1\nHello factory.\n\nPage 2\nSecond page.", encoding="utf-8")
    out = tmp_path / "out"

    manifest = ingest_local_file(source, out)

    assert manifest["status"] == "completed"
    assert manifest["chunks_count"] >= 1
    assert (out / "chunks.jsonl").exists()
    assert (out / "manifest.json").exists()
    assert (out / "keyword_index.json").exists()
