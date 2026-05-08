from rag_ingestion_factory.governance.audit import GovernanceAuditLog

def test_governance_audit_log():
    audit = GovernanceAuditLog()
    audit.record("verify", "passed", {"ok": True})
    summary = audit.summary()
    assert summary["events"] == 1
    assert summary["failures"] == 0
