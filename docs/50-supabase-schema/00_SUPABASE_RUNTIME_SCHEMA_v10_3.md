# Supabase Runtime Schema v10.3.0

## Purpose

v10.3.0 adds the Supabase runtime schema plan for AndyAI Knowledge Factory.

The Vercel shell needs a backend runtime.

Supabase provides the first product runtime layer:

```text
Auth
Postgres
RLS
Storage planning
usage metering
subscriptions
workspace membership
evidence persistence
Context Board persistence
```

## Product

```text
AndyAI Knowledge Factory
knowledgefactory.andyai.ai
```

## Canonical Rule

```text
Supabase stores product runtime truth.
The repository stores engineering canon.
```

## Tables

```text
profiles
workspaces
workspace_members
documents
ingestion_runs
chunks_metadata
evidence_packs
context_boards
drafts
approval_decisions
subscription_plans
subscriptions
usage_events
quota_counters
```

## Next

v10.4.0 — Auth + RLS Permission Model
