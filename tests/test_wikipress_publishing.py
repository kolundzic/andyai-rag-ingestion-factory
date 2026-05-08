from rag_ingestion_factory.wikipress.publishing import publishing_pipeline_status, sample_publish_job


def test_publishing_pipeline_status():
    status = publishing_pipeline_status()
    assert status["version"] == "v28.0.0"
    assert "publish" in status["stages"]


def test_sample_publish_job():
    assert sample_publish_job()["visibility"] == "private"
