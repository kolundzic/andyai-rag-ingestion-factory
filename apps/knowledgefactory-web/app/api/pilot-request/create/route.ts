import { createPilotRequestDemo } from "../../../lib/pilotApiRoutes";

export async function POST(request: Request) {
  const payload = await request.json().catch(() => ({}));
  return Response.json(createPilotRequestDemo(payload));
}

export async function GET() {
  return Response.json(createPilotRequestDemo({
    name: "Demo Client",
    email: "client@example.com",
    organization: "Example Organization",
    document_count_range: "50–200 documents",
    primary_domain: "technical documentation",
    main_problem: "Evidence-backed document search",
    success_criteria: "Traceable answers",
    privacy_level: "internal business documents"
  }));
}
