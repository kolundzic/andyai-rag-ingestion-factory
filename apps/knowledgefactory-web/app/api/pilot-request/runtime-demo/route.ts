import { getSupabaseRuntimeStatus, supabaseRuntimeWiring } from "../../../lib/supabaseRuntimeWiring";

export async function GET() {
  return Response.json({
    runtime_wiring: supabaseRuntimeWiring,
    status: getSupabaseRuntimeStatus()
  });
}
