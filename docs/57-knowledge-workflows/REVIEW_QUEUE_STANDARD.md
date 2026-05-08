# Review Queue Standard

## Purpose

The Review Queue makes agentic outputs inspectable by humans.

## Review Item Fields

```text
review_item_id
workflow_run_id
subject_type
subject_id
proposed_action
evidence_refs
status
reviewer
decision_reason
```

## Statuses

```text
pending
approved
rejected
needs_revision
locked
```

## Canonical Rule

```text
Human review is a system layer, not a courtesy.
```
