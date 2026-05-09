import { normalizePilotRequestPayload } from "../../../../lib/v1SubmitAdapters";

export async function POST(request: Request) {
  const body = await request.json().catch(() => null);
  if (!body?.company || !body?.use_case) {
    return Response.json({ ok: false, error: "company_and_use_case_required" }, { status: 400 });
  }

  const payload = normalizePilotRequestPayload(body);
  return Response.json({
    ok: true,
    mode: "public_beta_demo_adapter",
    target_table: "pilot_intake",
    payload
  });
}
