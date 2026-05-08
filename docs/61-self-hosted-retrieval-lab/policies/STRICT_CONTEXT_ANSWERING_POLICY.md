# Strict Context Answering Policy

## Purpose

The model must not fabricate answers when evidence is missing.

## Required Behavior

If the answer is not supported by retrieved context, the system must return:

```text
Not found in context.
```

or:

```text
Insufficient evidence in retrieved context.
```

## Policy

```text
No evidence, no trusted answer.
No citation, no durable answer.
No context support, no confident claim.
```

## Canonical Rule

```text
The answer must stay inside the evidence boundary.
```
