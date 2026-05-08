# Supabase Deployment Notes v10.3.0

## Local / Project Setup

Apply migrations from:

```text
supabase/migrations
```

## Environment Variables for Vercel

```text
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
```

## Important

The public web app should use anon key + RLS.

Server-side jobs may use service role, but must be isolated and never exposed to browser code.

## Canonical Rule

```text
Service role belongs only on the server.
```
