# API Wiring Plan

## Current Demo Route

```text
/api/pilot-request/runtime-demo
```

## Planned Real Routes

```text
POST /api/pilot-request/create
GET  /api/pilot-request/list
GET  /api/pilot-request/summary
PATCH /api/pilot-request/review
```

## Server-Side Responsibility

```text
validate payload
check tenant/workspace
call Supabase
return typed response
never leak service role key
```

## Client-Side Responsibility

```text
show safe runtime status
submit request through API
display success/failure clearly
avoid direct privileged database writes
```
