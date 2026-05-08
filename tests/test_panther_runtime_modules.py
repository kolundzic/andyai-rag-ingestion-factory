from rag_ingestion_factory.api_runtime.status import build_runtime_api_status
from rag_ingestion_factory.web_demo.playground import build_playground_demo_response
from rag_ingestion_factory.qdrant_live.status import build_live_qdrant_pipeline_status

def test_runtime_api_status():
    assert build_runtime_api_status()["site"] == "knowledgefactory.andyai.ai"

def test_playground_demo_response():
    response = build_playground_demo_response("demo")
    assert response["evidence_pack"]["citations"]

def test_live_qdrant_pipeline_status():
    assert build_live_qdrant_pipeline_status()["pipeline"] == "live-qdrant-ready"
