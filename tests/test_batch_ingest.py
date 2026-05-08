from pathlib import Path

from rag_ingestion_factory.jobs.batch_ingest import batch_ingest

def test_batch_ingest_txt(tmp_path: Path):
    src = tmp_path / "input"
    src.mkdir()
    (src / "a.txt").write_text("Page 1\nBatch ingestion works.", encoding="utf-8")

    out = tmp_path / "out"
    manifests = batch_ingest(src, out)

    assert len(manifests) == 1
    assert manifests[0]["status"] == "completed"
