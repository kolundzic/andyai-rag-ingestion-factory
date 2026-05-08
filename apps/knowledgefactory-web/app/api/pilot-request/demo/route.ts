import { pilotRequestConversion, qualifyPilotRequest } from "../../../lib/pilotRequestConversion";

export async function GET() {
  const sampleRequest = {
    documentCountRange: "50–200 documents",
    mainProblem: "We need evidence-backed search across technical PDFs and internal reports.",
    successCriteria: "Users should find answers faster and verify source documents.",
    privacyLevel: "internal business documents"
  };

  return Response.json({
    conversion_layer: pilotRequestConversion,
    sample_request: sampleRequest,
    qualification: qualifyPilotRequest(sampleRequest)
  });
}
