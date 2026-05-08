# Pilot API Route Contract

## Create

```text
POST /api/pilot-request/create
```

Accepts a pilot request payload and returns a typed demo response.

## List

```text
GET /api/pilot-request/list
```

Returns a safe list of sample requests.

## Summary

```text
GET /api/pilot-request/summary
```

Returns totals by status, priority, and runtime mode.

## Rule

```text
API routes must return typed status, not vague success strings.
```
