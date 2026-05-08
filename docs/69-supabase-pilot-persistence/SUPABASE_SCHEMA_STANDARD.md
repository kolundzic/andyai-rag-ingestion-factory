# Supabase Schema Standard — Pilot Requests

## Table

```text
public.pilot_requests
```

## Required Production Upgrade

The demo RLS policies are permissive for development.

Before production, replace them with tenant-bound rules:

```sql
using (tenant_id = auth.jwt() ->> 'tenant_id')
with check (tenant_id = auth.jwt() ->> 'tenant_id')
```

## Canonical Rule

```text
Persistence without tenant boundaries is not production readiness.
```
