import { curatorCommand } from "../../../lib/curatorCommand";
export async function GET() { return Response.json({ curator_command: curatorCommand }); }
