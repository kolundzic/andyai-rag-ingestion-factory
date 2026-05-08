from rag_ingestion_factory.runtime.supabase_runtime import (
    get_supabase_runtime_status,
    to_payload,
)


def test_runtime_status_mock_when_env_missing():
    status = get_supabase_runtime_status({})
    payload = to_payload(status)
    assert payload["runtime_mode"] == "mock"
    assert payload["database_connected"] is False
    assert payload["writes_enabled"] is False


def test_runtime_status_ready_when_env_present():
    status = get_supabase_runtime_status({
        "NEXT_PUBLIC_SUPABASE_URL": "https://example.supabase.co",
        "NEXT_PUBLIC_SUPABASE_ANON_KEY": "anon-demo",
    })
    assert status.runtime_mode == "supabase-client-ready"
    assert status.database_connected is True
    assert status.writes_enabled is False
