import { pilotProposalGenerator } from "../../../lib/pilotProposalGenerator";

export async function GET() {
  return Response.json({ proposal_layer: pilotProposalGenerator });
}
