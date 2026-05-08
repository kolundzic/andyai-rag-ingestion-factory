# Auth + RLS Permission Model v10.4.0

## Purpose

v10.4.0 hardens the product runtime permission model.

## Product

```text
AndyAI Knowledge Factory
knowledgefactory.andyai.ai
```

## Canonical Rule

```text
No RLS, no multi-tenant production.
```

## Core Policy

```text
auth.uid()
→ workspace_members
→ workspace_id
→ table access
```

## Roles

```text
owner
admin
editor
viewer
```

## Security Rule

```text
Browser uses anon key.
Server uses service role.
Service role is never exposed to the client.
```
