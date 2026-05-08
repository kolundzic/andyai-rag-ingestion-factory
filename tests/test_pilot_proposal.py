from rag_ingestion_factory.runtime.pilot_proposal import generate_pilot_proposal


def test_generate_pilot_proposal():
    proposal = generate_pilot_proposal("Example")
    assert "Example" in proposal["title"]
    assert proposal["next_step"]
