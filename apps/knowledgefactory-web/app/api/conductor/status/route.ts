import { conductor } from "../../../lib/conductor";

export async function GET() {
  return Response.json({ conductor });
}
