# Environment Variables Checklist

## Public Browser Variables

```text
NEXT_PUBLIC_PRODUCT_SITE=knowledgefactory.andyai.ai
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
```

## Server-Only Variables

```text
SUPABASE_SERVICE_ROLE_KEY=
QDRANT_URL=
QDRANT_API_KEY=
DATABASE_URL=
OPENAI_API_KEY=
```

## Canonical Rule

```text
Service secrets never enter browser code.
```
