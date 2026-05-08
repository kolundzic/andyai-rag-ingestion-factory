from rag_ingestion_factory.launch import launch_kernel_status


def test_launch_kernel_status():
    status = launch_kernel_status()
    assert status["version"] == "v30.0.0"
    assert "WikiPress Offer" in status["modules"]
