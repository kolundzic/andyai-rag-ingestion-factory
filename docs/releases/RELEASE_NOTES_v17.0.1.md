# Release Notes — v17.0.1

## Release Name

Supabase Persistence Verify Rescue

## Summary

v17.0.1 rescues the v17.0.0 Supabase Pilot Request Persistence release by fixing the verification import path.

## Root Cause

The v17.0.0 Python smoke test imported `rag_ingestion_factory` without setting `PYTHONPATH=src`.

## Fix

All Python smoke tests now use:

```bash
PYTHONPATH=src python3 ...
```

## Included

- Supabase migration for `pilot_requests`
- seed data
- demo RLS policies
- schema standard docs
- RLS notes
- runtime adapter docs
- deployment checklist
- persistence roadmap
- pilot persistence schema
- sample persistence payloads
- `/pilot-admin/persistence` page
- `/api/pilot-request/persistence-demo` route
- runtime adapter module
- corrected verification script

## Canonical Rule

```text
A pilot request becomes operational only when it can be stored, reviewed, protected, and followed up.
```

## Next

```text
v17.1.0 — Supabase Client Runtime Wiring
```
