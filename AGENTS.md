# TC Partners Official Hub - Agent Instructions

Este arquivo define as regras locais para agentes atuando neste no.

## Identidade do no

- Projeto: TC Partners Official Hub
- Papel: camada zero da presenca digital oficial da TC Partners
- Stack: Astro, TypeScript, PWA
- Package manager oficial: PNPM
- Deploy oficial: cPanel
- Dominio SEO/JSON-LD vigente: `https://tcpartners.com.br`

## Fronteira local

Este diretorio nao consome um `pnpm-workspace.yaml` ou instrucoes de agente em pasta pai imediata.
Por PNPM, este pacote tambem pode ser capturado pelo workspace superior em `/Users/nettomello/CODIGOS`.
Para normalizar somente este no, usar `pnpm install --ignore-workspace`.

Nos compartilham servicos e contratos. Nos nao compartilham arquivos.
Nao criar acoplamento por codigo com outros projetos.

## Antes de alterar

Ler, nesta ordem, quando existirem:

1. `AGENTS.md`
2. `CONTEXT.md`
3. `SETUP.md`
4. `SKILL.md`
5. `MEMORY.md`
6. `README.md`
7. `BRANDING.md`

Nao alterar `.env`, credenciais, chaves, tokens, arquivos privados ou configuracoes sensiveis.
Nao ler nem expor segredos sem autorizacao explicita.

## Escopo preferencial de mudanca

Priorizar alteracoes pequenas e auditaveis em:

- responsividade e mobile
- conteudo dos cards e canais
- SEO e JSON-LD
- PWA e manifest
- performance visual
- acessibilidade basica
- consistencia com `BRANDING.md`

Evitar rewrites, novas dependencias e abstracoes futuras sem necessidade real.

## Contratos atuais

- LinkedIn confirmado: `https://www.linkedin.com/company/tc-partners-importacoes`
- WhatsApp confirmado: `+55 47 99205-1159`
- Instagram confirmado: `https://www.instagram.com/tcpartnerscomex`
- E-mail confirmado: `candido@tcpartners.com.br`
- Facebook confirmado para SEO/JSON-LD: `https://www.facebook.com/profile.php?id=61590785032838`
- Paleta aprovada: `#3729BE`, `#02B8F9`, `#000522`
- Favicon atual aprovado como base local: `public/favicon.svg`
- Logo de topo: `public/logos/tc-logo.svg`

## Integracoes previstas

Futuras integracoes devem preservar degradacao segura e auditabilidade:

- Google Analytics
- Meta Pixel
- recursos avancados de UTM
- Meta for Developers
- CRM
- formulario de captacao

Nao implementar integracao externa sem contrato definido e sem caminho de desligamento.

## Validacao

Para mudancas JS/TS/Astro, rodar:

```bash
pnpm run build
```

Quando houver mudanca visual relevante, tambem rodar:

```bash
pnpm run dev
```

e validar no navegador em mobile e desktop.

Se forem adicionados scripts de lint, typecheck ou testes, atualizar `SETUP.md`.
