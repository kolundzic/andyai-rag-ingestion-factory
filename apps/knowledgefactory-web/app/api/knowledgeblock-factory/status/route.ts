import { knowledgeBlockFactory } from "../../../lib/knowledgeBlockFactory";

export async function GET() {
  return Response.json({ knowledgeblock_factory: knowledgeBlockFactory });
}
