# Auth + RLS Permission Model

## Rule

```text
User identity plus workspace membership determines access.
```

## RLS Policy Direction

```text
workspace_id IN memberships where user_id = auth.uid()
```

## Canonical Rule

```text
No RLS, no multi-tenant production.
```
