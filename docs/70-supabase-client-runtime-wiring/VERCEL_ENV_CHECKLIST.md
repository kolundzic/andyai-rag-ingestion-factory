# Vercel Environment Checklist

## Before Connecting Supabase

```text
confirm Supabase project URL
confirm anon key
confirm RLS policy state
confirm table migration applied
confirm seed data exists
confirm Vercel env variables configured
```

## Vercel Variables

```text
NEXT_PUBLIC_SUPABASE_URL
NEXT_PUBLIC_SUPABASE_ANON_KEY
```

## Production Warning

```text
Do not use service role key in browser-side code.
```

## Smoke Test

```text
open /pilot-admin/runtime
open /api/pilot-request/runtime-demo
confirm runtime mode
confirm safe fallback if env missing
```
