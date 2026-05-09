import { normalizeFeedbackPayload } from "../../../../lib/v1SubmitAdapters";

export async function POST(request: Request) {
  const body = await request.json().catch(() => null);
  if (!body?.message) {
    return Response.json({ ok: false, error: "message_required" }, { status: 400 });
  }

  const payload = normalizeFeedbackPayload(body);
  return Response.json({
    ok: true,
    mode: "public_beta_demo_adapter",
    target_table: "public_interest",
    payload
  });
}
