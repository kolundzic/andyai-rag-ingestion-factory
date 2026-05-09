import { curatorDemo } from "../../../lib/curatorDemo";

export async function GET() {
  return Response.json({ curator_demo: curatorDemo });
}
