import { wikiPressOffer } from "../../../lib/wikiPressOffer";

export async function GET() {
  return Response.json({ wikipress_offer: wikiPressOffer });
}
