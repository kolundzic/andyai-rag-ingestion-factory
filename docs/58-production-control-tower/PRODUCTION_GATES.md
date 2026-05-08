# Production Gates

## Gate 1 — Repo Gate

```text
verify passes
working tree clean
tag exists
GitHub metadata correct
README current
```

## Gate 2 — Web Gate

```text
Next.js app builds
landing page works
API demo routes work
product domain set
```

## Gate 3 — Runtime Gate

```text
Supabase migrations apply
RLS enabled
usage tables exist
quota tables exist
```

## Gate 4 — Retrieval Gate

```text
Qdrant reachable
collection exists
payload permissions available
evidence pack generated
```

## Gate 5 — Human Gate

```text
operator review completed
rollback path known
release proof saved
```

## Canonical Rule

```text
A gate is not a suggestion. A gate is a production boundary.
```
