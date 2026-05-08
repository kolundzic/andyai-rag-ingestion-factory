import { llmWikiBridge } from "../../../lib/llmWikiBridge";

export async function GET() {
  return Response.json({ llm_wiki_bridge: llmWikiBridge });
}
