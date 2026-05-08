from rag_ingestion_factory.pipelines.knowledgeblock_pipeline import run_knowledgeblock_pipeline


def test_run_knowledgeblock_pipeline():
    run = run_knowledgeblock_pipeline()
    assert run["run_id"] == "kb-production-demo"
    assert run["stages"]
