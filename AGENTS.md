<!-- markdownlint-disable MD003 MD007 MD013 MD022 MD023 MD025 MD029 MD032 MD033 MD034 -->
# AGENTS

```text
========================================
    STUDIO ODONTO · AGENT INSTRUCTIONS
========================================
Status: ACTIVE
Version: v1.0.0
========================================
```

## ⟠ Identidade do Nó

Instruções e regras locais para agentes autônomos atuando neste nó digital:

- **Projeto**: Studio Odonto Official Hub
- **Papel**: Camada zero da presença digital oficial da Studio Odonto (Solution Odonto)
- **Stack**: Astro 7.2.1, TypeScript, PWA
- **Package Manager**: PNPM (versão >= 11)
- **Deploy Oficial**: Cloudflare Pages (`studioodonto.pages.dev` / `studioodonto.xyz`) + Render.com (backup)
- **Domínio SEO/JSON-LD**: `https://studioodonto.xyz`

────────────────────────────────────────

## ⨷ Fronteira Local

Este diretório é autônomo, não consome um `pnpm-workspace.yaml` na raiz do projeto (apenas para configurações locais de build), e pode ser capturado pelo workspace superior em `/Users/nettomello/CODIGOS`.

- Para isolar e instalar apenas este nó, use: `pnpm install --ignore-workspace` (gerenciado por `make install`).
- Projetos compartilham contratos, mas não arquivos. Não crie acoplamento de código entre este nó e outros diretórios do workspace.

────────────────────────────────────────

## ⧉ Antes de Alterar

Consulte e compreenda a documentação local nesta ordem de precedência:

1. `AGENTS.md` (Este documento)
2. `CONTEXT.md` (Contexto de negócios do cliente)
3. `SETUP.md` (Guia de ambiente e troubleshooting)
4. `SKILL.md` (Habilidades do nó)
5. `MEMORY.md` (Histórico de decisões do projeto)
6. `README.md` / `BRANDING.md`

> [!CAUTION]
> Não altere chaves de ambiente `.env`, segredos, tokens ou configurações sensíveis. Nunca insira credenciais em arquivos monitorados pelo Git.

────────────────────────────────────────

## ⍟ Escopo Preferencial

Priorize pequenas alterações e melhorias focadas em:

- Responsividade e otimização visual para mobile.
- Conteúdo dos cards, links e canais de contato.
- Otimização de SEO (JSON-LD, meta tags, sitemap).
- Integração PWA, manifestos de ícones e service worker.
- Desempenho geral e conformidade com `BRANDING.md`.

Evite refatorações massivas ou adição de novas dependências sem aprovação explícita.

────────────────────────────────────────

## ⨷ Contratos Atuais

Valores oficiais validados pelo cliente:

- **WhatsApp**: `+55 62 99267-2199`
- **Instagram**: `https://www.instagram.com/solutionodonto/`
- **E-mail**: `lucieneleao@studioodonto.xyz`
- **Facebook (SEO/JSON-LD)**: `Studio Odonto` (Página comercial ID: `708178602387338`)
- **Google Analytics 4**: `G-3M1YV9J2DB`
- **Meta Pixel**: `2786954951664102` (Dual-Tracking ativo via Edge Function `/api/meta-capi`)
- **Google Search Console**: Verificação via meta tag `r0bzqvqZmUZ22-Pq_JYvEEIcegKJG2hf-2XarX-nYME`
- **Rotas de Redirecionamento Curto**: `/wa` e `/agendar` (disparam evento `Contact` e repassam UTMs)
- **Paleta de Cores**: Bege Claro `#F7F5F0`, Ouro `#DB9E16`, Texto `#000000`
- **Logotipos**: `public/logo_horiz.svg` e `public/logos/logo.png`

────────────────────────────────────────

## ◬ Integrações Ativas

- Google Analytics 4 (`G-3M1YV9J2DB`)
- Meta Pixel & Conversions API (C-API Dual-Tracking) (Ver `docs/META-config.md`)
- Captura de parâmetros UTM (propagação dinâmica em links de WhatsApp)
- Content Signals (IETF draft) em `public/robots.txt` + `public/llms.txt`

────────────────────────────────────────

## ⚙ Validação

O Makefile local é o orquestrador padrão. Sempre execute validações completas antes de finalizar tarefas:

1. Auditoria, sincronização e build de produção:

   ```bash
   make verify
   ```

2. Servidor local de desenvolvimento:

   ```bash
   make dev
   ```

> [!IMPORTANT]
> Em caso de erros de compilação nativa do `esbuild` ou `sharp` decorrentes de restrições do pnpm v11, execute `make install` para rodar o processo de reinstalação com auto-recompilação.
