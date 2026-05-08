from rag_ingestion_factory.tenant.governance import TenantBoundary, tenant_can_use_collection

def test_tenant_can_use_collection():
    b = TenantBoundary("t1", ("c1",), ("reader",))
    assert tenant_can_use_collection(b, "c1")
