export async function GET() {
  return Response.json({ conductor_public_explainer: { status: "ready", formula: "Conductor → Worker → Verifier → Human → Evidence → Trusted Knowledge" } });
}
