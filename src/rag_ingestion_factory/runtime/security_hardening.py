from __future__ import annotations

CHECKLIST = ["tenant-bound RLS", "workspace isolation", "server-only service role key", "audit trail", "separate Vercel envs"]


def score_security_readiness(completed: list[str]) -> dict[str, int]:
    total = len(CHECKLIST)
    return {"total": total, "completed": len(completed), "score": round(len(completed) / total * 100)}
