export const controlTowerStatus = {
  product: "AndyAI Knowledge Factory",
  site: "knowledgefactory.andyai.ai",
  version: "v16.0.0",
  readinessLevel: "deploy-candidate",
  rule: "No production deploy without readiness gates, rollback path, and proof bundle.",
  gates: [
    { name: "Repo Gate", status: "pass", detail: "verify, tag, README, metadata" },
    { name: "Vercel Gate", status: "candidate", detail: "product shell exists; build verification next" },
    { name: "Supabase Gate", status: "candidate", detail: "schema exists; live project connection next" },
    { name: "Qdrant Gate", status: "planned", detail: "live connection remains gated" },
    { name: "Domain Gate", status: "locked", detail: "knowledgefactory.andyai.ai" },
    { name: "Rollback Gate", status: "documented", detail: "rollback to v15.0.0" }
  ]
};
