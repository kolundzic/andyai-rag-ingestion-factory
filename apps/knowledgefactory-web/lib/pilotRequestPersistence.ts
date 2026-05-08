export const pilotRequestPersistence = {
  product: "AndyAI Knowledge Factory",
  site: "knowledgefactory.andyai.ai",
  version: "v17.0.1",
  canonicalRule: "A pilot request becomes operational only when it can be stored, reviewed, protected, and followed up.",
  serbianRule: "Pilot zahtev postaje operativan tek kada može da se sačuva, pregleda, zaštiti i prati dalje.",
  table: "public.pilot_requests",
  migration: "db/supabase/migrations/017_pilot_request_persistence.sql",
  seed: "db/supabase/seeds/017_pilot_request_seed.sql",
  rlsState: "demo policies enabled; production tenant policies required",
  fields: [
    "tenant_id",
    "workspace_id",
    "name",
    "email",
    "organization",
    "document_count_range",
    "document_type",
    "primary_domain",
    "main_problem",
    "success_criteria",
    "privacy_level",
    "pilot_timeline",
    "qualification_score",
    "qualification_status",
    "review_status",
    "priority",
    "next_action",
    "review_owner",
    "review_notes"
  ],
  demoRecord: {
    id: "demo-persisted-pilot-001",
    tenant_id: "demo-tenant",
    workspace_id: "demo-workspace",
    name: "Demo Client",
    email: "client@example.com",
    organization: "Example Organization",
    document_count_range: "50–200 documents",
    primary_domain: "technical documentation",
    main_problem: "We need evidence-backed search across technical PDFs and internal reports.",
    success_criteria: "Users should find answers faster and verify source documents.",
    privacy_level: "internal business documents",
    qualification_score: 100,
    qualification_status: "green",
    review_status: "approved_for_pilot",
    priority: "high",
    next_action: "Schedule pilot review call",
    review_owner: "AndyAI operator",
    review_notes: "Clear document scope, strong evidence-traceability need, and measurable success criteria."
  }
};

export function summarizePersistenceReadiness() {
  return {
    table: pilotRequestPersistence.table,
    migration: pilotRequestPersistence.migration,
    seed: pilotRequestPersistence.seed,
    rlsState: pilotRequestPersistence.rlsState,
    status: "ready_for_supabase_lab_apply",
    next: "v17.1.0 — Supabase Client Runtime Wiring"
  };
}
