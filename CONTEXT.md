# TC Partners Official Hub - Contexto Local

## O que este projeto e

O TC Partners Official Hub e a camada zero da presenca digital oficial da TC Partners.
Ele centraliza canais oficiais em uma experiencia mobile-first, leve, instalavel como PWA e preparada para evoluir para aquisicao de trafego pago.

Este projeto nao e o sistema completo da TC Partners.
Ele e um no frontend nao soberano.

## Papel no ecossistema

O frontend entrega acesso, medicao e experiencia.
Autoridade de negocio, CRM, ledger, automacoes e decisoes comerciais futuras devem viver em servicos proprios, expostos por contratos.

Regra local:

- frontend nao decide estado comercial
- frontend nao guarda segredos
- frontend nao duplica CRM
- frontend emite eventos e preserva parametros de origem
- backend ou servicos externos devem deter autoridade operacional

## Contrato atual de presenca

- Nome de marca: TC Partners
- Razao social: TC Importacao e Exportacao LTDA
- CNPJ: 24.825.654/0001-12
- Base: Itajai, Santa Catarina, Brasil
- Assinatura: `Parceiros para ir alem das fronteiras_`
- Dominio SEO/JSON-LD vigente: `https://tcpartners.com.br`
- Deploy oficial: cPanel

## Canais oficiais

Confirmado:

- LinkedIn: `https://www.linkedin.com/company/tc-partners-importacoes`
- WhatsApp: `+55 47 99205-1159`
- Instagram: `https://www.instagram.com/tcpartnerscomex`
- E-mail: `candido@tcpartners.com.br`
- Facebook: `https://www.facebook.com/profile.php?id=61590785032838`

Observacao:

- Facebook entra como canal social oficial em SEO/JSON-LD, sem obrigacao de card ou botao na interface v1.
- A logo exibida no topo deve consumir `public/logos/tc-logo.svg`.

## Branding

Fonte local de verdade: `BRANDING.md`.

Paleta aprovada:

- Indigo: `#3729BE`
- Azul eletrico: `#02B8F9`
- Fundo quase-preto azulado: `#000522`

Favicon local de referencia:

- `public/favicon.svg`

## Evolucao planejada

v1:

- hub oficial
- PWA
- canais principais
- SEO/JSON-LD
- eventos locais de clique

v2/v3:

- trafego pago
- Google Analytics
- Meta Pixel
- UTMs avancadas
- Meta for Developers
- CRM
- formulario de captacao

Essas evolucoes devem ser desenhadas por contrato antes de codigo.

## Divergencias documentais conhecidas

`docs/main-plan.md` contem referencias legadas a Cloudflare Pages, Vercel e PostHog.
A direcao vigente informada para este no e:

- cPanel como deploy oficial
- PNPM como package manager oficial
- Google Analytics e Meta Pixel como integracoes futuras
