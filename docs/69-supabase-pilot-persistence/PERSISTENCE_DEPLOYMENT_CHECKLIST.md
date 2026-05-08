# Persistence Deployment Checklist

## Before Running Migration

```text
confirm Supabase project
confirm environment variables
confirm database backup policy
confirm RLS policy strategy
confirm tenant model
```

## Apply

```text
supabase db push
```

or paste migration through Supabase SQL editor for early lab testing.

## Production Warning

Do not expose production pilot data with demo RLS policies.
