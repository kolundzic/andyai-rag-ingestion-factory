# Supabase Environment Standard

## Required Runtime Variables

```text
NEXT_PUBLIC_SUPABASE_URL
NEXT_PUBLIC_SUPABASE_ANON_KEY
```

## Optional Server Variables

```text
SUPABASE_SERVICE_ROLE_KEY
SUPABASE_JWT_SECRET
SUPABASE_PROJECT_REF
```

## Local Development

```bash
cp .env.example apps/knowledgefactory-web/.env.local
```

## Production / Vercel

Set variables in Vercel project settings:

```text
Project Settings
→ Environment Variables
→ Production / Preview / Development
```

## Canonical Rule

```text
No environment variable should be hardcoded into source code.
```
