export const commandCenter = {
  version: "v19.0.0",
  status: "pilot-system-command-center-ready",
  canonicalRule: "The pilot system is no longer a form. It is a governed business intake machine.",
  modules: [
    "client pitch",
    "pilot request",
    "pilot admin",
    "Supabase persistence",
    "runtime wiring",
    "API routes",
    "review actions",
    "audit trail",
    "production hardening",
    "proposal generator",
    "follow-up drafts",
    "ops dashboard"
  ],
  readiness: {
    score: 82,
    ready: [
      "visual proof",
      "business intake flow",
      "admin review",
      "persistence foundation",
      "runtime fallback",
      "audit model",
      "proposal and follow-up drafts"
    ],
    blocked: [
      "real authenticated Supabase writes",
      "final tenant auth",
      "payment/subscription integration"
    ]
  }
};
