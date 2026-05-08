export type RuntimeMode = "mock" | "supabase-client-ready" | "supabase-server-ready" | "disabled";

export type SupabaseRuntimeStatus = {
  runtime_mode: RuntimeMode;
  database_connected: boolean;
  writes_enabled: boolean;
  safe_message: string;
  required_env: string[];
};

export const supabaseRuntimeWiring = {
  product: "AndyAI Knowledge Factory",
  site: "knowledgefactory.andyai.ai",
  version: "v17.1.0",
  canonicalRule: "Persistence is the table. Runtime wiring is the bridge between product and database.",
  serbianRule: "Persistence je tabela. Runtime wiring je most između proizvoda i baze.",
  requiredEnv: [
    "NEXT_PUBLIC_SUPABASE_URL",
    "NEXT_PUBLIC_SUPABASE_ANON_KEY"
  ],
  optionalServerEnv: [
    "SUPABASE_SERVICE_ROLE_KEY",
    "SUPABASE_JWT_SECRET",
    "SUPABASE_PROJECT_REF"
  ],
  table: "public.pilot_requests",
  routes: [
    "/pilot-admin/runtime",
    "/api/pilot-request/runtime-demo",
    "/pilot-admin/persistence",
    "/pilot-request"
  ],
  adapterOperations: [
    "createPilotRequest",
    "listPilotRequests",
    "summarizePilotRequests",
    "getRuntimeStatus"
  ]
};

export function getSupabaseRuntimeStatus(env: Record<string, string | undefined> = process.env): SupabaseRuntimeStatus {
  const hasUrl = Boolean(env.NEXT_PUBLIC_SUPABASE_URL);
  const hasAnon = Boolean(env.NEXT_PUBLIC_SUPABASE_ANON_KEY);

  if (hasUrl && hasAnon) {
    return {
      runtime_mode: "supabase-client-ready",
      database_connected: true,
      writes_enabled: false,
      safe_message: "Supabase environment is configured. Writes remain guarded until create/list API routes are hardened.",
      required_env: supabaseRuntimeWiring.requiredEnv
    };
  }

  return {
    runtime_mode: "mock",
    database_connected: false,
    writes_enabled: false,
    safe_message: "Supabase environment is not configured yet. Product pages use safe mock mode.",
    required_env: supabaseRuntimeWiring.requiredEnv
  };
}
