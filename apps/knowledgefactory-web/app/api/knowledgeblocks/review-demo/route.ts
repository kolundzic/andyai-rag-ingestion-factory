import { knowledgeBlockReviewQueue } from "../../../lib/knowledgeBlockReviewQueue";

export async function GET() {
  return Response.json({ review_queue: knowledgeBlockReviewQueue });
}
