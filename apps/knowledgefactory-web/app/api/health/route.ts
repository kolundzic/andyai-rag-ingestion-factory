export async function GET() {
  return Response.json({
    status: "ok",
    product: "AndyAI Knowledge Factory",
    site: "knowledgefactory.andyai.ai",
    version: "11.0.0"
  });
}
