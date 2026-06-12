# TC Partners Official Hub - Memoria Local

Este arquivo registra decisoes e fatos locais nao sensiveis.
Nao armazenar credenciais, tokens, chaves privadas, cookies, dados pessoais desnecessarios ou segredos.

## 2026-06-03 - Contrato local de frontend e documentacao

Decisoes vigentes:

- O projeto trabalhara front-end com foco em responsividade/mobile, conteudo dos cards/canais e SEO/PWA.
- O dominio vigente para SEO/JSON-LD e `https://tcpartners.com.br`.
- PNPM e o package manager oficial do projeto.
- cPanel segue como deploy oficial.
- Paleta aprovada: `#3729BE`, `#02B8F9`, `#000522`.
- Favicon local de referencia: `public/favicon.svg`.
- LinkedIn confirmado: `https://www.linkedin.com/company/tc-partners-importacoes`.
- WhatsApp confirmado: `+55 47 99205-1159`.
- Instagram confirmado: `https://www.instagram.com/tcpartnerscomex`.
- E-mail confirmado: `candido@tcpartners.com.br`.
- Facebook confirmado para SEO/JSON-LD, sem obrigacao de botao/card na v1: `https://www.facebook.com/profile.php?id=61590785032838`.
- A logo exibida no topo deve consumir `public/logos/tc-logo.svg`.

Checagem de pasta pai:

- Nao foi encontrado `pnpm-workspace.yaml` em pasta pai imediata deste no.
- Nao foram encontrados `AGENTS.md`, `CONTEXT.md`, `SETUP.md`, `SKILL.md` ou `MEMORY.md` em pasta pai imediata para este projeto.
- Depois da validacao do Vite, foi confirmado que o PNPM captura este projeto pelo workspace superior `/Users/nettomello/CODIGOS`.
- Para normalizar somente este no, usar `pnpm install --ignore-workspace`.

Integracoes futuras planejadas:

- Google Analytics
- Meta Pixel
- UTMs avancadas
- Meta for Developers
- CRM
- formulario de captacao

Observacao:

- `docs/main-plan.md` contem referencias legadas a Cloudflare Pages, Vercel e PostHog. A direcao vigente e cPanel, PNPM, Google Analytics e Meta Pixel futuros.

## 2026-06-03 - Vite 8 warning no Astro 6

Sintoma:

- Astro avisou: `Vite 8.0.16 detected in your project. Astro requires Vite 7.`

Causa:

- O `node_modules/vite` local resolvia `8.0.16`, mesmo com o lockfile do pacote ja apontando Vite 7 em dependencias transitivas.
- O projeto esta dentro do workspace PNPM superior `/Users/nettomello/CODIGOS`; `pnpm install` sem flag foi absorvido pelo workspace mestre.

Correcao aplicada:

- Adicionado `devDependencies.vite: ^7`.
- Adicionado `pnpm.overrides.vite: ^7`.
- Rodado `pnpm install --ignore-workspace` para normalizar o no local.

Validacao:

- `node -p "require('vite/package.json').version"` retornou `7.3.5`.
- `pnpm run build` passou.

## 2026-06-03 - Canais oficiais confirmados

Dados recebidos para uso:

- E-mail: `candido@tcpartners.com.br`
- WhatsApp: `+55 47 99205-1159`
- Instagram: `https://www.instagram.com/tcpartnerscomex`

Aplicacao esperada:

- Atualizar cards do hub.
- Atualizar vCard.
- Atualizar SEO/JSON-LD quando o canal fizer parte do schema publico.

## 2026-06-03 - Dominio oficial e publicacao cPanel

Dados recebidos:

- Dominio oficial: `https://tcpartners.com.br/`
- Acesso ao cPanel disponivel pelo operador.

Decisao:

- `https://tcpartners.com.br` passa a ser o dominio canonico para SEO/JSON-LD.
- cPanel passa a ser o deploy oficial de producao.
- O build Astro continua estatico e deve publicar o conteudo de `dist/` em `public_html/`.

## 2026-06-03 - MissingSharp no Astro Image

Sintoma:

- Astro avisou: `MissingSharp: Could not find Sharp`.

Causa:

- O logo do header usa `Image` de `astro:assets`.
- O pipeline de imagem do Astro precisa de `sharp` no ambiente de build.
- A causa nao e o tamanho do SVG.

Correcao aplicada:

- Adicionado `devDependencies.sharp: ^0.34.5`.
- Rodado `pnpm install --ignore-workspace`.

Validacao:

- `node -e "console.log(require('sharp/package.json').version)"` retornou `0.34.5`.
- `pnpm run build` passou e gerou o logo otimizado.

## 2026-06-03 - Make install capturando workspace superior

Sintoma:

- `make install` executou `pnpm install` puro.
- O PNPM subiu ate `/Users/nettomello/CODIGOS/pnpm-workspace.yaml`.
- A instalacao entrou em `Scope: all 7 workspace projects` e instalou dependencias do workspace inteiro.

Causa:

- O `makefile` ainda nao refletia a regra local `pnpm install --ignore-workspace`.

Correcao aplicada:

- `install`, `repair`, `repair-lockfile` e `update` passaram a usar `--ignore-workspace`.
- `SETUP.md` passou a recomendar `make install` ou `pnpm install --ignore-workspace`.

## 2026-06-03 - Botao PWA sem acao

Sintoma:

- O prompt `Adicionar app` podia aparecer sem executar instalacao visivel.
- Em navegadores sem `beforeinstallprompt`, o clique fechava o prompt silenciosamente.

Causa:

- O componente dependia de `deferredEvent`.
- iOS/Safari e alguns navegadores nao disparam `beforeinstallprompt`.

Correcao aplicada:

- O CTA passou a ser um `button` real.
- Quando existe `beforeinstallprompt`, o botao chama `deferredEvent.prompt()`.
- Quando nao existe prompt nativo, o botao mostra instrucao de instalacao por plataforma.
- O evento `appinstalled` fecha o prompt e registra `pwa_installed`.

## 2026-06-03 - cPanel como unico alvo operacional

Decisao:

- Vercel nao e mais alvo operacional deste projeto.
- O arquivo `vercel.json` foi removido para reduzir ruido de deploy.
- O pacote de publicacao vigente e o ZIP com o conteudo de `dist/` na raiz para upload em `public_html/`.
