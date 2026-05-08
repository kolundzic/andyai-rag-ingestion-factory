export async function GET() {
  return Response.json({
    product: "AndyAI Knowledge Factory",
    site: "knowledgefactory.andyai.ai",
    runtime: "Vercel Product Shell",
    backend_next: "Supabase Runtime",
    version: "11.0.0"
  });
}
