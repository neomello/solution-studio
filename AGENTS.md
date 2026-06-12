# Studio Odonto Official Hub - Agent Instructions

Este arquivo define as regras locais para agentes atuando neste nó.

## Identidade do nó

- Projeto: Studio Odonto Official Hub
- Papel: camada zero da presença digital oficial da Studio Odonto (Solution Odonto)
- Stack: Astro, TypeScript, PWA
- Package manager oficial: PNPM
- Deploy oficial: cPanel
- Domínio SEO/JSON-LD vigente: `https://studioodonto.xyz`

## Fronteira local

Este diretório não consome um `pnpm-workspace.yaml` ou instruções de agente em pasta pai imediata.
Por PNPM, este pacote também pode ser capturado pelo workspace superior em `/Users/nettomello/CODIGOS`.
Para normalizar somente este nó, usar `pnpm install --ignore-workspace`.

Nós compartilham serviços e contratos. Nós não compartilham arquivos.
Não criar acoplamento por código com outros projetos.

## Antes de alterar

Ler, nesta ordem, quando existirem:

1. `AGENTS.md`
2. `CONTEXT.md`
3. `SETUP.md`
4. `SKILL.md`
5. `MEMORY.md`
6. `README.md`
7. `BRANDING.md`

Não alterar `.env`, credenciais, chaves, tokens, arquivos privados ou configurações sensíveis.
Não ler nem expor segredos sem autorização explícita.

## Escopo preferencial de mudança

Priorizar alterações pequenas e auditáveis em:

- responsividade e mobile
- conteúdo dos cards e canais
- SEO e JSON-LD
- PWA e manifest
- performance visual
- acessibilidade básica
- consistência com `BRANDING.md`

Evitar rewrites, novas dependências e abstrações futuras sem necessidade real.

## Contratos atuais

- WhatsApp confirmado: `+55 62 99358-8139`
- Instagram confirmado: `https://www.instagram.com/solutionodonto/`
- E-mail confirmado: `studioodonto.goiania@gmail.com`
- Facebook confirmado para SEO/JSON-LD: `Studio Odonto` (ID: `708178602387338`)
- Paleta aprovada: Fundo `#F7F5F0`, Ouro `#DB9E16`, Texto `#000000`
- Configurações Meta detalhadas em: `docs/META-config.md`
- Logo principal: `public/logo_horiz.svg` e `public/logos/logo.png`

## Integrações previstas

Futuras integrações devem preservar degradação segura e auditabilidade:

- Google Analytics
- Meta Pixel e Conversions API (C-API)
- recursos avançados de UTM
- Meta for Developers
- Formulário de captação

Não implementar integração externa sem contrato definido e sem caminho de desligamento.

## Validação

Para mudanças JS/TS/Astro, rodar:

```bash
pnpm run build
```

Quando houver mudança visual relevante, também rodar:

```bash
pnpm run dev
```

e validar no navegador em mobile e desktop.

Se forem adicionados scripts de lint, typecheck ou testes, atualizar `SETUP.md`.
