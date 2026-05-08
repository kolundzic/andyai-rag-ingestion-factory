import { publishingPipeline } from "../../../lib/publishingPipeline";

export async function GET() {
  return Response.json({ publishing_pipeline: publishingPipeline });
}
