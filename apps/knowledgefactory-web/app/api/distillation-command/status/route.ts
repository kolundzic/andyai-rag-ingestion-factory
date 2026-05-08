import { distillationCommandLayer } from "../../../lib/distillationCommandLayer";

export async function GET() {
  return Response.json({ distillation_command_layer: distillationCommandLayer });
}
