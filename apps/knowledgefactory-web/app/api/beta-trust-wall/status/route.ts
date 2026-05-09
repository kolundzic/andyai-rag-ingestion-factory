export async function GET() {
  return Response.json({ beta_trust_wall: { status: "ready", proofs: ["release_proof", "route_health", "conductor_layer", "supabase_persistence", "human_approval"] } });
}
