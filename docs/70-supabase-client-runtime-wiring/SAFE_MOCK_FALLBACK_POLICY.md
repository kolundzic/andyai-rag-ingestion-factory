# Safe Mock Fallback Policy

## Why

During early product development, Vercel pages must remain visible even when Supabase credentials are not configured yet.

## Behavior

If Supabase env vars are missing:

```text
runtime_mode = mock
database_connected = false
writes_enabled = false
safe_message = Supabase environment is not configured yet.
```

If Supabase env vars exist:

```text
runtime_mode = supabase-client-ready
database_connected = configured
writes_enabled = guarded
```

## Canonical Rule

```text
Missing credentials should produce a safe status, not a broken product.
```
