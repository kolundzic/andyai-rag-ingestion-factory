from rag_ingestion_factory.supabase.runtime_schema import RUNTIME_TABLES, build_supabase_runtime_status

def test_supabase_runtime_status():
    status = build_supabase_runtime_status()
    assert status["site"] == "knowledgefactory.andyai.ai"
    assert "workspaces" in status["tables"]
    assert "evidence_packs" in RUNTIME_TABLES
