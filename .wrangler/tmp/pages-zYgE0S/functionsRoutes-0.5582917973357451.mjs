import { onRequestPost as __api_meta_capi_ts_onRequestPost } from "/Users/nettomello/CODIGOS/projects/clientes/studio-odonto-official-hub/functions/api/meta-capi.ts"

export const routes = [
    {
      routePath: "/api/meta-capi",
      mountPath: "/api",
      method: "POST",
      middlewares: [],
      modules: [__api_meta_capi_ts_onRequestPost],
    },
  ]