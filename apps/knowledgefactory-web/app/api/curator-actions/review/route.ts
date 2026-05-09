export async function GET() { return Response.json({ review: { status: "pending", decision: null } }); }
export async function POST() { return Response.json({ review: { status: "recorded", decision: "approved", mode: "demo" } }); }
