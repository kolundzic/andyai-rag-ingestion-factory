# Pilot Admin Queue Spec

## Admin Queue Fields

```text
request_id
submitted_at
name
email
organization
document_count_range
primary_domain
privacy_level
qualification_score
status
priority
next_action
review_owner
review_notes
```

## Status Values

```text
new
reviewing
needs_scope
approved_for_pilot
rejected
archived
```

## Priority Values

```text
high
medium
low
```

## Canonical Rule

```text
Every pilot request must have a status and a next action.
```
