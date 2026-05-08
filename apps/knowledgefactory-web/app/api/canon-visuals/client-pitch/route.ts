import { clientPitchMode } from "../../../lib/clientPitchMode";

export async function GET() {
  return Response.json({ pitch_mode: clientPitchMode });
}
