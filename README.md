<!-- markdownlint-disable MD003 MD007 MD013 MD022 MD023 MD025 MD029 MD032 MD033 MD034 -->
# HUB

![Studio Odonto Official Hub banner](./docs/assets/studio-odonto-official-hub-banner.svg)

# Studio Odonto · Hub Oficial

```text
========================================
   STUDIO ODONTO · HUB OFICIAL
========================================
Status: ACTIVE
Version: v1.0.0
Stack: Astro 7.2.1 · TypeScript · PWA · Cloudflare Edge
Deploy Oficial: Cloudflare Pages (studioodonto.pages.dev / studioodonto.xyz)
========================================
```

> **Cliente:** Studio Odonto (Solution Odonto)
> **Endereço:** Edifício Aquarius Center Empresarial - R. T-36 - St. Bueno, Goiânia - GO, 74230-105

────────────────────────────────────────

## 🔗 Links Rápidos do Ecossistema (Fácil Acesso)

| Categoria | Recurso / Destino | Link |
|---|---|---|
| **Portal Oficial** | Domínio Principal | [studioodonto.xyz](https://studioodonto.xyz/) |
| **Cloudflare Pages** | URL Direta Edge | [studioodonto.pages.dev](https://studioodonto.pages.dev/) |
| **Meta Ads / Automação** | Rota Curta WhatsApp | [studioodonto.xyz/wa](https://studioodonto.xyz/wa) |
| **Meta Ads / Automação** | Rota Alias Agendamento | [studioodonto.xyz/agendar](https://studioodonto.xyz/agendar) |
| **Meta Ads / Automação** | Link com UTM Comment Auto-Reply | [studioodonto.xyz/wa?utm_medium=comment_auto_reply](https://studioodonto.xyz/wa?utm_medium=comment_auto_reply) |
| **WhatsApp Direto** | Atendimento Comercial (`+55 62 99267-2199`) | [wa.me/5562992672199](https://wa.me/5562992672199) |
| **Redes Sociais** | Instagram Oficial (`@solutionodonto`) | [instagram.com/solutionodonto](https://www.instagram.com/solutionodonto/) |
| **Redes Sociais** | Página Comercial Facebook (`ID: 708178602387338`) | [facebook.com/StudioOdonto](https://www.facebook.com/profile.php?id=708178602387338) |
| **Contato Corporativo** | E-mail Oficial | [lucieneleao@studioodonto.xyz](mailto:lucieneleao@studioodonto.xyz) |
| **Descoberta por IA** | Manifesto LLMs Agentic Ingestion | [studioodonto.xyz/llms.txt](https://studioodonto.xyz/llms.txt) |
| **SEO & Indexação** | Robots + Content Signals (IETF Draft) | [studioodonto.xyz/robots.txt](https://studioodonto.xyz/robots.txt) |
| **SEO & Indexação** | Sitemap XML | [studioodonto.xyz/sitemap.xml](https://studioodonto.xyz/sitemap.xml) |
| **Painéis & Analytics** | Meta Events Manager (Pixel `2786954951664102`) | [Meta Events Manager](https://eventsmanager.facebook.com/events/v2/overview?selected_data_source_id=2786954951664102) |
| **Painéis & Analytics** | Google Analytics 4 (`G-3M1YV9J2DB`) | [Google Analytics Stream](https://analytics.google.com/) |

────────────────────────────────────────

## ⟠ Objetivo

Portal institucional oficial do Studio Odonto.
Hub de acesso centralizado aos canais da marca —
leve, rápido e instalável como aplicativo (PWA).

Não é "site em construção".
É a camada zero da presença digital oficial.

────────────────────────────────────────

## ⧇ Comandos

```bash
make install      # instala dependências e executa o rebuild automático
make dev          # inicia o servidor local em http://localhost:4321
make build        # gera o build de produção estático em dist/
make preview      # visualiza o build de produção localmente
make deploy-cf    # faz deploy instantâneo no Cloudflare Pages
make verify       # executa a validação completa do protocolo
```

────────────────────────────────────────

## ⧉ Estrutura

```text
src/
├── components/
│   ├── AccessCard.astro       card individual de acesso
│   ├── AccessGrid.astro       grid dos canais
│   ├── BackgroundMotion.astro fundo limpo
│   ├── OfficialStatus.astro   badge do local
│   ├── PortalHeader.astro     logo SVG oficial
│   ├── PWAPrompt.astro        prompt PWA
│   ├── QRCode.astro           QR aponta studioodonto.xyz (só desktop)
│   ├── SaveContact.astro      botão vCard .vcf
│   └── SplashIntro.astro      splash da marca
├── data/
│   └── links.ts               Canais: WhatsApp, E-mail, Instagram
├── layouts/
│   └── BaseLayout.astro       SEO, meta, JSON-LD, PWA, splash iOS
├── lib/
│   ├── analytics.ts           dispatcher CustomEvent tc:click
│   └── pwa.ts                 service worker helper
├── pages/
│   └── index.astro            página principal
└── styles/
    ├── global.css             reset + base
    ├── motion.css             keyframes (slideUp, scaleIn, fadeIn, etc.)
    └── tokens.css             design tokens (paleta, espaçamento, radius)

public/
├── logos/                     SVGs da marca
├── icons/                     ícones PWA
├── splash/                    splash screens iOS
├── og/                        Open Graph image
├── robots.txt                 política de indexação
├── favicon.svg / favicon.ico  favicons
└── site.webmanifest           manifesto PWA
```

────────────────────────────────────────

## ◮ Canais (v1)

```text
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ #  CANAL                AÇÃO
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ 1  WhatsApp Comercial   +55 62 99267-2199
┃ 2  E-mail               lucieneleao@studioodonto.xyz
┃ 3  Instagram            instagram.com/solutionodonto
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Facebook oficial usado em SEO/JSON-LD, sem card na v1:
`Studio Odonto (ID: 708178602387338)`

────────────────────────────────────────

## ⨀ Tier 1

```text
▓▓▓ FUNCIONALIDADES
────────────────────────────────────────
└─ Splash Screen          Logomarca Studio Odonto
└─ Status bar iPhone      Localização Goiânia
└─ Logo hero              Logo principal
└─ PWA instalável         prompt inferior, manifest e SW
└─ vCard                  .vcf com contato
└─ QR Code                desktop-only, aponta studioodonto.xyz
└─ Analytics              CustomEvent click em todos os cards
└─ JSON-LD                schema Organization
└─ Splash screens iOS     suporte
└─ SW otimizado           Workbox via @vite-pwa/astro
```

────────────────────────────────────────

## ⧖ Roadmap

```text
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ VERSÃO   ESCOPO
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ v1       Core + Hub Oficial
┃ v2       Painel analytics · C-API · Meta Pixel
┃ v3       Site completo · Captação de Leads
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

────────────────────────────────────────

## ◬ Referências

- [BRANDING.md](./BRANDING.md) — design tokens e paleta oficial
- [docs/META-config.md](./docs/META-config.md) — Identificadores para Facebook, WhatsApp, C-API
