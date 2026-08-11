import AstroPWA from "@vite-pwa/astro";
import { defineConfig } from "astro/config";

export default defineConfig({
  integrations: [
    AstroPWA({
      registerType: "autoUpdate",
      manifest: false,
      devOptions: {
        enabled: true,
        suppressWarnings: true,
      },
      workbox: {
        globPatterns: [
          "**/*.{js,css,html,ico,svg}",
          "icons/*.png",
          "*.png",
          "og/*.png",
        ],
        globIgnores: [
          "splash/**",
          "png/**",
          "web-app-manifest-*.png",
          "workbox-*.js",
        ],
        navigateFallback: "/",
        navigateFallbackDenylist: [/^\/_assets\//],
        runtimeCaching: [
          {
            urlPattern: /^https:\/\/fonts\.googleapis\.com\/.*/i,
            handler: "CacheFirst",
            options: {
              cacheName: "google-fonts-cache",
              expiration: { maxEntries: 10, maxAgeSeconds: 60 * 60 * 24 * 365 },
            },
          },
          {
            urlPattern: /^https:\/\/fonts\.gstatic\.com\/.*/i,
            handler: "CacheFirst",
            options: {
              cacheName: "gstatic-fonts-cache",
              expiration: { maxEntries: 10, maxAgeSeconds: 60 * 60 * 24 * 365 },
            },
          },
        ],
      },
    }),
  ],
  build: {
    assets: "_assets",
  },
  vite: {
    build: {
      cssMinify: true,
    },
    plugins: [
      {
        name: "dev-meta-capi-middleware",
        configureServer(server) {
          server.middlewares.use("/api/meta-capi", async (req, res) => {
            if (req.method === "POST") {
              let bodyStr = "";
              req.on("data", (chunk) => {
                bodyStr += chunk;
              });
              req.on("end", async () => {
                try {
                  const body = JSON.parse(bodyStr || "{}");
                  const token = process.env.META_API_TOKEN;
                  const pixelId =
                    process.env.PUBLIC_META_PIXEL_ID || "2786954951664102";

                  if (!token) {
                    res.statusCode = 400;
                    res.setHeader("Content-Type", "application/json");
                    res.end(
                      JSON.stringify({
                        success: false,
                        error: "META_API_TOKEN is not configured in .env",
                      })
                    );
                    return;
                  }

                  const clientIp =
                    req.headers["x-forwarded-for"] ||
                    req.socket.remoteAddress ||
                    "";
                  const userAgent = req.headers["user-agent"] || "";
                  const eventName = body.event_name || "PageView";
                  const eventId =
                    body.event_id ||
                    `evt_${Date.now()}_${Math.random().toString(36).substring(2, 9)}`;
                  const eventSourceUrl =
                    body.event_source_url ||
                    req.headers["referer"] ||
                    "https://studioodonto.xyz/";

                  const payload = {
                    data: [
                      {
                        event_name: eventName,
                        event_time: Math.floor(Date.now() / 1000),
                        event_id: eventId,
                        event_source_url: eventSourceUrl,
                        action_source: "website",
                        user_data: {
                          client_ip_address: clientIp,
                          client_user_agent: userAgent,
                          fbp: body.user_data?.fbp,
                          fbc: body.user_data?.fbc,
                        },
                        custom_data: body.custom_data || {},
                      },
                    ],
                  };

                  const graphUrl = `https://graph.facebook.net/v20.0/${pixelId}/events?access_token=${token}`;
                  const metaResponse = await fetch(graphUrl, {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(payload),
                  });
                  const metaResult = await metaResponse.json();

                  res.statusCode = metaResponse.status;
                  res.setHeader("Content-Type", "application/json");
                  res.end(
                    JSON.stringify({
                      success: metaResponse.ok,
                      event_id: eventId,
                      meta_result: metaResult,
                    })
                  );
                } catch (err) {
                  res.statusCode = 500;
                  res.setHeader("Content-Type", "application/json");
                  res.end(
                    JSON.stringify({ success: false, error: err?.message })
                  );
                }
              });
            } else {
              res.statusCode = 405;
              res.end();
            }
          });
        },
      },
    ],
  },
});
