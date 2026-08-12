<!-- markdownlint-disable MD003 MD007 MD013 MD022 MD023 MD025 MD029 MD032 MD033 MD034 -->
# MEMORY

```text
========================================
     STUDIO ODONTO · PROJECT MEMORY
========================================
Status: ACTIVE
Version: v1.0.0
========================================
```

## ⟠ Objetivo

Este arquivo registra decisões arquiteturais, alterações contratuais e dados operacionais não-sensíveis do projeto Studio Odonto Hub.

> [!WARNING]
> Nunca registre chaves de API, senhas, tokens ou dados pessoais sensíveis neste arquivo.

────────────────────────────────────────

## ⧉ Histórico de Decisões

### 2026-06-12 — Rebranding para Studio Odonto

Transição de identidade visual e canais do hub digital:

- **Domínio Vigente**: `https://studioodonto.xyz` para SEO e schema JSON-LD.
- **Paleta Aprovada**: Fundo Bege Claro `#F7F5F0`, Ouro `#DB9E16` e Texto `#000000`.
- **Favicon**: Atualizado em conformidade com o novo design (`public/favicon.svg`).
- **Canais Sociais**:
  - **WhatsApp**: `+55 62 99267-2199` (Atualizado em 2026-07-17).
  - **Instagram**: `https://www.instagram.com/solutionodonto/`.
  - **E-mail**: `lucieneleao@studioodonto.xyz`.
  - **Facebook Page**: `Studio Odonto` (ID comercial: `708178602387338`).
  - **LinkedIn**: Removido por decisão comercial.
- **Identidade da Logo**: O hub consome exclusivamente `public/logo_horiz.svg` e `public/logos/logo.png`.

### 2026-08-11 — Vinculação Meta Ads, Meta C-API, SEO @graph & Content Signals

Consolidação da infraestrutura de medição, descoberta e deploy:

- **Meta App Gestor**: `NEØFLW // Ads Manager` (App ID: `470678155999569`).
- **Meta Pixel ID**: `2786954951664102`.
- **Modo Hard Avançado (C-API Dual Tracking)**:
  - Ativado endpoint Edge (`functions/api/meta-capi.ts`) com proxy local via middleware Vite no `astro.config.mjs`.
  - Disparo síncrono no cliente com `event_id` determinístico para deduplicação perfeita na Meta.
  - Coleta e propagação de cookies `_fbp` e `_fbc`.
- **SEO Canônico & AEO (@graph Schema)**:
  - Atualizado JSON-LD para o tipo especializado `Dentist` com `@graph` (`Dentist` + `WebSite`).
  - Mapeamento de desambiguação de marca (`alternateName: ["Solution Odonto"]`), geolocalização (`geo`), área de atendimento (`areaServed`) e especialidades (`knowsAbout`).
  - Purificação de URLs canônicas removendo parâmetros dinâmicos de rastreamento (`utm_*`, `fbclid`).
- **Agentic Ingestion & Content Signals**:
  - Injetados Content Signals (`IETF draft`) no `public/robots.txt` (`ai-train=yes, search=yes, ai-input=yes`).
  - Permissão explícita a robôs de IA (`GPTBot`, `ClaudeBot`, `PerplexityBot`, `Google-Extended`).
  - Criado manifesto de descoberta soberano em Markdown (`public/llms.txt`).
- **Orquestração & Makefile**:
  - Alinhado `makefile` ao padrão canônico NΞØ Protocol (caixa 44-col, auto-aprovação de builds nativos do pnpm v11 em `make install`).
- **Infraestrutura de Deploy**:
  - O site é hospedado no **Render.com** (serviço: `solution-studio.onrender.com`, repositório: `neomello/solution-studio`).
  - O deploy é acionado automaticamente a cada `git push origin main` (gerenciado por `make deploy`).
  - DNS e SSL gerenciados pela Cloudflare apontando para o Render.
- **Documentação de Referência**: `docs/META-config.md`.

### 2026-08-12 — Deploy Cloudflare Pages, Rotas Curta /wa & /agendar e Meta Ads

Consolidação de infraestrutura e tráfego pago:

- **Deploy Oficial no Cloudflare Pages**:
  - Projeto `studioodonto` criado e publicado diretamente no Cloudflare Pages (`studioodonto.pages.dev` / `studioodonto.xyz`).
  - Autenticação e comandos de CLI via `make cf-login`, `make whoami` e `make deploy-cf` (tempo de deploy < 2 segundos).
- **Rotas de Redirecionamento Curto (`/wa` & `/agendar`)**:
  - Criadas as páginas `src/pages/wa.astro` e `src/pages/agendar.astro` voltadas para anúncios do Meta Ads (ex: resposta automática a comentários com `utm_medium=comment_auto_reply`).
  - As rotas disparam o evento **`Contact`** via Meta Dual-Tracking (Navegador + C-API) com `event_id` idêntico e redirecionam para o WhatsApp preservando todas as UTMs.
- **Verificação Google Search Console**:
  - Injetada a meta tag `<meta name="google-site-verification" content="r0bzqvqZmUZ22-Pq_JYvEEIcegKJG2hf-2XarX-nYME" />` no `<head>` do `BaseLayout.astro`.
- **Atualização de Pacotes & Resolução TypeScript**:
  - Pacotes atualizados para `astro 7.2.1`, `@lucide/astro 1.31.0` e `wrangler 4.121.0`.
  - Resolvido o aviso `ts(2835)` em scripts Astro client-side utilizando importação explícita de módulos.

────────────────────────────────────────

## ◬ Integrações Ativas & Validadas

- **Google Analytics 4**: ID `G-3M1YV9J2DB`
- **Meta Pixel & C-API**: ID `2786954951664102` (Dual-Tracking ativo via Edge Function `/api/meta-capi`)
- **Rotas Curta WhatsApp**: `/wa` e `/agendar` ativas com captura de UTMs e disparo do evento `Contact`
- **Captura de parâmetros UTM**: Ativo no sessionStorage com repasse para links de WhatsApp
- **PWA & Offline Service Worker**: Configurado e validado
- **SEO/AEO & Content Signals**: Ativos em `robots.txt` e `llms.txt`

