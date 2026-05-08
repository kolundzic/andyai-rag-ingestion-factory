# Deployment Guide v10.2.0

## App Path

```text
apps/knowledgefactory-web
```

## Local Dev

```bash
cd apps/knowledgefactory-web
npm install
npm run dev
```

## Vercel Project

Recommended project name:

```text
andyai-knowledge-factory
```

## Production Domain

```text
knowledgefactory.andyai.ai
```

## Future Environment Variables

```text
NEXT_PUBLIC_PRODUCT_SITE=knowledgefactory.andyai.ai
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
```

## Canonical Rule

```text
Deploy the shell first.
Connect runtime second.
```
