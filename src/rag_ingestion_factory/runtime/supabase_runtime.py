from __future__ import annotations

from dataclasses import dataclass, asdict
from os import getenv


REQUIRED_ENV = (
    "NEXT_PUBLIC_SUPABASE_URL",
    "NEXT_PUBLIC_SUPABASE_ANON_KEY",
)


@dataclass(frozen=True)
class SupabaseRuntimeStatus:
    runtime_mode: str
    database_connected: bool
    writes_enabled: bool
    safe_message: str
    required_env: tuple[str, ...] = REQUIRED_ENV


def get_supabase_runtime_status(env: dict[str, str | None] | None = None) -> SupabaseRuntimeStatus:
    source = env if env is not None else {key: getenv(key) for key in REQUIRED_ENV}
    has_url = bool(source.get("NEXT_PUBLIC_SUPABASE_URL"))
    has_anon = bool(source.get("NEXT_PUBLIC_SUPABASE_ANON_KEY"))

    if has_url and has_anon:
        return SupabaseRuntimeStatus(
            runtime_mode="supabase-client-ready",
            database_connected=True,
            writes_enabled=False,
            safe_message="Supabase environment is configured. Writes remain guarded until create/list API routes are hardened.",
        )

    return SupabaseRuntimeStatus(
        runtime_mode="mock",
        database_connected=False,
        writes_enabled=False,
        safe_message="Supabase environment is not configured yet. Product pages use safe mock mode.",
    )


def to_payload(status: SupabaseRuntimeStatus) -> dict[str, object]:
    return asdict(status)
