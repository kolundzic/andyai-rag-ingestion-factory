from rag_ingestion_factory.runtime.command_center import command_center_status


def test_command_center_status():
    status = command_center_status()
    assert status["version"] == "v19.0.0"
    assert status["score"] >= 80
    assert "pilot request" in status["modules"]
