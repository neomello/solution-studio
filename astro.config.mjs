import AstroPWA from "@vite-pwa/astro";
import { defineConfig } from "astro/config";

export default defineConfig({
  integrations: [
    AstroPWA({
      registerType: "autoUpdate",
      manifest: false,
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
  },
});
