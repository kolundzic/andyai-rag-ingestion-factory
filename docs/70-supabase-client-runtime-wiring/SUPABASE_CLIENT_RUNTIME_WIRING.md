# v17.1.0 — Supabase Client Runtime Wiring

## Mission

Create the runtime bridge between the Knowledge Factory product surface and the Supabase pilot request persistence layer.

## Canonical Sentence

```text
Persistence is the table. Runtime wiring is the bridge between product and database.
```

Serbian:

```text
Persistence je tabela. Runtime wiring je most između proizvoda i baze.
```

## Product Meaning

v17.0.1 created the database persistence foundation.

v17.1.0 adds the runtime wiring plan and safe adapter layer:

```text
Vercel page / API
→ runtime adapter
→ Supabase client config
→ pilot_requests table
→ safe fallback
→ admin review surface
```

## Safety Rule

```text
Never fail the product page because Supabase env vars are missing. Fall back to a safe mock state.
```

## Routes

```text
/pilot-admin/runtime
/api/pilot-request/runtime-demo
```
