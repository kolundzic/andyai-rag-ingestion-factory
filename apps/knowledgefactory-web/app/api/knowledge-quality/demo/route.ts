import { knowledgeQuality } from "../../../lib/knowledgeQuality";

export async function GET() {
  return Response.json({ knowledge_quality: knowledgeQuality });
}
