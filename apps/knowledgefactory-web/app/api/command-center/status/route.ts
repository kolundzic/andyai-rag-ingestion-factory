import { commandCenter } from "../../../lib/commandCenter";

export async function GET() {
  return Response.json({ command_center: commandCenter });
}
