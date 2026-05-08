# v17.2.0 — Pilot Create/List API Route Scaffolding

## Mission

Create the first operational API traffic lanes for pilot requests.

## Canonical Sentence

```text
Runtime wiring connects the bridge. API routes define the traffic lanes.
```

Serbian:

```text
Runtime wiring povezuje most. API rute određuju trake kojima prolazi saobraćaj.
```

## Routes

```text
POST /api/pilot-request/create
GET  /api/pilot-request/list
GET  /api/pilot-request/summary
```

## Scope

v17.2.0 provides safe mock-aware API route scaffolding. Real Supabase writes stay guarded until production policies and server-side validation are hardened.
