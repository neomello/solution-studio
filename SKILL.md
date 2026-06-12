# TC Partners Official Hub - Local Skill

Use este fluxo para tarefas recorrentes neste projeto.

## Fluxo obrigatorio

input -> normalizacao -> diagnostico -> proposta minima -> patch -> validacao -> proximo comando

## Alterar frontend

1. Ler `AGENTS.md`, `CONTEXT.md`, `SETUP.md`, `MEMORY.md`, `README.md` e `BRANDING.md`.
2. Identificar se a mudanca toca responsividade, conteudo, SEO/PWA, analytics ou integracao futura.
3. Preservar a arquitetura Astro existente.
4. Editar o menor conjunto de arquivos possivel.
5. Rodar `pnpm run build`.
6. Para mudanca visual, abrir em navegador e validar mobile e desktop.

## Alterar canais

1. Confirmar se o canal e oficial ou pendente.
2. Atualizar `src/data/links.ts` somente com dados confirmados.
3. Se o canal alterar contrato publico, atualizar `CONTEXT.md` e `README.md`.
4. Validar build.

## Alterar SEO ou JSON-LD

1. Confirmar dominio canonico vigente.
2. Hoje o dominio vigente e `https://tcpartners.com.br`.
3. Nao trocar para outro dominio sem decisao explicita.
4. Manter dados legais consistentes com o contexto local.
5. Validar build.

## Alterar PWA

1. Verificar `astro.config.mjs`.
2. Verificar `public/site.webmanifest`.
3. Verificar icones em `public/icons` e favicon em `public/favicon.svg`.
4. Validar build.
5. Fazer smoke test de manifest e assets.

## Preparar analytics futuro

Antes de implementar Google Analytics, Meta Pixel, Meta for Developers, CRM ou formulario:

1. Definir contrato de eventos.
2. Definir estrategia de consentimento e desligamento.
3. Definir como UTMs serao preservadas.
4. Definir destino autoritativo dos leads.
5. Evitar segredos no frontend.

## Saida esperada ao finalizar

Informar:

- causa provavel
- arquivos afetados
- patch/codigo pronto
- comando para testar
- risco residual
