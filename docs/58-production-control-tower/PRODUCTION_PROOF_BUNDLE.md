# Production Proof Bundle

## Purpose

The proof bundle records evidence that a release is ready or not ready.

## Bundle Fields

```text
release_version
product_site
repo_status
vercel_status
supabase_status
qdrant_status
env_status
domain_status
gate_results
rollback_path
operator_notes
created_at
```

## Canonical Rule

```text
If we cannot prove readiness, we are not ready.
```
