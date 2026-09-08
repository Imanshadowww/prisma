// @ts-check
import { module } from "@prisma/composer";
import nextjsTailscaleVpnService from "./service.mjs";

export default module("prisma", ({ provision }) => {
  provision(nextjsTailscaleVpnService, { id: "nextjstailscalevpn" });
});
