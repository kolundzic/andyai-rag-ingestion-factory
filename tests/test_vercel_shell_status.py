from rag_ingestion_factory.product.vercel_shell import build_vercel_shell_status

def test_vercel_shell_status():
    status = build_vercel_shell_status()
    assert status["site"] == "knowledgefactory.andyai.ai"
    assert "/playground" in status["pages"]
