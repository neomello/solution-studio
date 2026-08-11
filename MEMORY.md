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

────────────────────────────────────────

## ◬ Integrações Ativas & Validadas

- **Google Analytics 4**: ID `G-3M1YV9J2DB`
- **Meta Pixel**: ID `2786954951664102` (Dual-Tracking com Conversions API)
- **Captura de parâmetros UTM**: Ativo no sessionStorage com repasse para links de WhatsApp
- **PWA & Offline Service Worker**: Configurado e validado
- **SEO/AEO & Content Signals**: Ativos em `robots.txt` e `llms.txt`

