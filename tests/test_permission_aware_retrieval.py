from rag_ingestion_factory.retrieval.models import RetrievalCandidate
from rag_ingestion_factory.retrieval.permission_aware import filter_candidates_by_permission
from rag_ingestion_factory.security.access_policy import AccessPolicy, PermissionContext

def test_filter_candidates_by_permission():
    candidate = RetrievalCandidate("chk_1", "doc_1", "demo.txt", 1, 1, "Demo", "text", 0.9, "hybrid")
    policies = {"chk_1": AccessPolicy(tenant_id="t1", classification="internal", allowed_roles=("reader",))}
    context = PermissionContext(user_id="u1", tenant_id="t1", roles=("reader",), clearance_level="internal")
    allowed = filter_candidates_by_permission([candidate], policies, context)
    assert len(allowed) == 1
