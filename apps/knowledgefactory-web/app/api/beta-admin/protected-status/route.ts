export async function GET() {
  return Response.json({
    protected_admin: {
      status: "ready",
      mode: "read_only_demo_fallback",
      guard: "server_only_service_role_required_for_real_admin_reads",
      queues: ["public_interest", "pilot_intake"]
    }
  });
}
