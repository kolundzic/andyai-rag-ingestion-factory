# Pilot Review Decision Model

## Decision States

| Status | Meaning | Recommended Next Action |
|---|---|---|
| new | request received | assign reviewer |
| reviewing | operator is evaluating | inspect scope |
| needs_scope | not enough information | schedule scoping call |
| approved_for_pilot | ready for pilot | send pilot proposal |
| rejected | not a fit now | send polite decline |
| archived | closed / inactive | no action |

## Decision Criteria

```text
document scope clarity
business pain clarity
privacy risk
human reviewer availability
evidence traceability need
timeline realism
```

## Canonical Rule

```text
Do not approve a pilot without scope, success criteria, and owner.
```
