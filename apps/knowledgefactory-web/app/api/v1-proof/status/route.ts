export async function GET() {
  return Response.json({
    v1_proof: {
      status: "proof_pack_ready",
      proofs: ["post_routes", "supabase_tables", "rls_policy", "vercel_smoke", "trust_wall", "release_tags", "operator_script"]
    }
  });
}
