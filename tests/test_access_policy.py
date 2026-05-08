from rag_ingestion_factory.security.access_policy import AccessPolicy, PermissionContext, can_access

def test_can_access_with_role():
    policy = AccessPolicy(tenant_id="t1", classification="internal", allowed_roles=("finance",))
    context = PermissionContext(user_id="u1", tenant_id="t1", roles=("finance",), clearance_level="internal")
    assert can_access(policy, context)

def test_cannot_access_other_tenant():
    policy = AccessPolicy(tenant_id="t1", classification="internal", allowed_roles=("finance",))
    context = PermissionContext(user_id="u1", tenant_id="t2", roles=("finance",), clearance_level="internal")
    assert not can_access(policy, context)
