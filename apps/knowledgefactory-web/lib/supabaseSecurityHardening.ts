export const supabaseSecurityHardening = {
  version: "v18.0.0",
  canonicalRule: "Demo RLS lets the lab breathe. Production RLS lets the business survive.",
  productionBlockers: [
    "demo RLS still enabled",
    "service role key exposed to browser",
    "tenant claim missing",
    "workspace isolation missing",
    "audit trail disabled"
  ],
  checklist: [
    "tenant-bound RLS",
    "workspace isolation",
    "server-only service role key",
    "audit trail",
    "separate Vercel envs"
  ]
};

export function scoreSecurityReadiness(completed: string[]) {
  const total = supabaseSecurityHardening.checklist.length;
  return { total, completed: completed.length, score: Math.round((completed.length / total) * 100) };
}
