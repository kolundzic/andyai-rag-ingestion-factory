from rag_ingestion_factory.distillation.command_layer import command_status


def test_command_status():
    assert "extract_candidates" in command_status()["commands"]
