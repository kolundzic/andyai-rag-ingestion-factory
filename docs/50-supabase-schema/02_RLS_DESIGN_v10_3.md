# RLS Design v10.3.0

## Principle

```text
User identity plus workspace membership determines access.
```

## Workspace Rule

A user can access workspace data only if:

```text
auth.uid() is a member of that workspace
```

## Role Direction

```text
owner
admin
editor
viewer
```

## Canonical Rule

```text
No RLS, no multi-tenant production.
```

## v10.3 Scope

v10.3 adds table structure and policy placeholders.

v10.4 will harden Auth + RLS policies into the main implementation layer.
