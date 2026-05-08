# Runtime Adapter Contract

## Purpose

The runtime adapter hides whether pilot request data comes from:

```text
mock data
Supabase browser client
Supabase server client
future internal API
```

## Required Operations

```text
createPilotRequest
listPilotRequests
summarizePilotRequests
getRuntimeStatus
```

## Adapter Modes

```text
mock
supabase-client
supabase-server
disabled
```

## v17.1.0 Scope

This release implements a safe mock-aware runtime contract and product-facing runtime status.

Actual authenticated Supabase writes are prepared for a later production hardening release.
