import { selfHostedRetrievalSignal } from "../../../lib/selfHostedRetrieval";

export async function GET() {
  return Response.json({
    product: "AndyAI Knowledge Factory",
    site: "knowledgefactory.andyai.ai",
    signal: "DeepSeek V4 + TurboVec + RAG",
    interpretation: selfHostedRetrievalSignal.canonicalSentence,
    adapters: selfHostedRetrievalSignal.adapters,
    strict_context_answer: "Not found in context."
  });
}
