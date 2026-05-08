# v17.0.1 — Supabase Pilot Request Persistence Rescue

## Mission

Move pilot requests from static demo payloads toward a real Supabase-backed persistence model.

## Rescue Note

v17.0.0 stopped during verification because the Python smoke test did not use `PYTHONPATH=src`.
v17.0.1 fixes that verification path and completes the persistence release.

## Canonical Sentence

```text
A pilot request becomes operational only when it can be stored, reviewed, protected, and followed up.
```

Serbian:

```text
Pilot zahtev postaje operativan tek kada može da se sačuva, pregleda, zaštiti i prati dalje.
```

## Routes

```text
/pilot-admin/persistence
/api/pilot-request/persistence-demo
```
