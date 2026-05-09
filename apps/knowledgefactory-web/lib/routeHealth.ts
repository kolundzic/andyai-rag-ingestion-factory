import { publicSurface } from "./publicSurface";

export const routeHealth = {
  version: "v80.0.0",
  status: "green",
  routes: publicSurface.routes.map((route) => ({ route, health: "green" }))
};
