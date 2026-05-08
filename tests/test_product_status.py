from rag_ingestion_factory.product.status import build_product_status

def test_product_status():
    status = build_product_status()
    assert status["product_site"] == "knowledgefactory.andyai.ai"
    assert status["product_name"] == "AndyAI Knowledge Factory"
