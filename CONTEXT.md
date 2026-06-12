# Studio Odonto Official Hub - Contexto Local

## O que este projeto é

O Studio Odonto Official Hub é a camada zero da presença digital oficial do Studio Odonto (também referenciado como Solution Odonto).
Ele centraliza canais oficiais em uma experiência mobile-first, leve, instalável como PWA e preparada para evoluir para aquisição de tráfego pago.

Este projeto não é o sistema completo da clínica.
Ele é um nó frontend não soberano.

## Papel no ecossistema

O frontend entrega acesso, medição e experiência.
Autoridade de negócio, CRM, ledger, automações e decisões comerciais futuras devem viver em serviços próprios, expostos por contratos.

Regra local:

- frontend não decide estado comercial
- frontend não guarda segredos
- frontend não duplica CRM
- frontend emite eventos e preserva parâmetros de origem
- backend ou serviços externos devem deter autoridade operacional

## Contrato atual de presença

- Nome de marca: Studio Odonto (Solution Odonto)
- Endereço: Rua T-36, Setor Bueno, Goiânia - GO, 74230-105
- Assinatura: (A definir, sem tagline atual)
- Domínio SEO/JSON-LD vigente: `https://studioodonto.xyz`
- Deploy oficial: cPanel

## Canais oficiais

Confirmado:

- WhatsApp: `+55 62 99358-8139`
- Instagram: `https://www.instagram.com/solutionodonto/`
- E-mail: `studioodonto.goiania@gmail.com`
- Facebook: `Studio Odonto` (Página comercial, ID: 708178602387338)

Observação:

- LinkedIn não será utilizado.
- Facebook entra como canal social oficial em SEO/JSON-LD, e como fonte primária para a C-API/Pixel Meta.
- A logo exibida no topo deve consumir `public/logo_horiz.svg` e `public/logos/logo.png`.
- Metadados do Meta (C-API, WhatsApp App) estão documentados em `docs/META-config.md`.

## Branding

Fonte local de verdade: `BRANDING.md`.

Paleta aprovada:

- Fundo (Clean): `#F7F5F0`
- Ouro (Accent): `#DB9E16`
- Fonte (Textos): `#000000`

Favicon local de referência:

- `public/favicon.svg` (A ser adaptado para a nova marca)

## Evolução planejada

v1:

- hub oficial
- PWA
- canais principais
- SEO/JSON-LD
- eventos locais de clique

v2/v3:

- tráfego pago
- Google Analytics
- Meta Pixel e Conversions API
- UTMs avançadas
- Meta for Developers
- Formulário de captação

Essas evoluções devem ser desenhadas por contrato antes de código.
