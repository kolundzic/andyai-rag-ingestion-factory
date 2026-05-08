# Supabase Deploy Readiness

## Required Runtime Layer

```text
Auth
Postgres
RLS
workspaces
documents
evidence packs
context boards
subscriptions
usage events
quota counters
```

## Required Checks

```text
migrations exist
RLS placeholder exists
RLS hardening policy exists
subscription seeds exist
service role never exposed
anon key only in browser
```

## Canonical Rule

```text
No RLS, no multi-tenant production.
```
