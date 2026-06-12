<!-- markdownlint-disable MD003 MD007 MD013 MD022 MD023 MD025 MD029 MD032 MD033 MD034 -->
# PLANO MESTRE

```text
========================================
   TC PARTNERS · MAIN PLAN
========================================
Status: ACTIVE
Version: v1.1.0
Escopo: Hub Institucional Oficial (v1)
========================================
```

> **Status:** active
> **Escopo v1:** Core + Tier 1 (fechado)
> **Stack:** Astro + TypeScript + PWA
> **Deploy:** Cloudflare Pages · **Analytics:** PostHog

Documento de direção do projeto.
Lido por NEØ e por agentes IA antes de qualquer linha de código.

Objetivo duplo:
- entregar o que o cliente pediu (simples, 4 acessos, estilo VECT)
- entregar acima da expectativa para converter a TC Partners
  em cliente recorrente

────────────────────────────────────────

## ⟠ 0 · Contexto e leitura estratégica

O cliente pediu, como inspiração, algo simples:
uma página com 4 links, no estilo da referência vect.com.br
(logo central + "site em construção" + ícones de contato).

Não vamos entregar isso.

Vamos entregar algo que parece tão simples quanto,
mas que opera num patamar diferente.
O objetivo real não é "fazer a página".
É fazer a TC Partners querer continuar trabalhando com a gente.

A referência VECT tem fraquezas que viram nossas vantagens:

```text
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ VECT (referência)        →  TC PARTNERS (nossa entrega)
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ "site em construção"     →  "presença oficial", pronto
┃ imagem pesada de fundo   →  identidade animada nativa, < 1s
┃ página estática          →  PWA instalável, vira app
┃ genérico (qualquer um)   →  símbolo C/navio, história da marca
┃ não mede nada            →  cada clique vira dado estratégico
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

> **Tese:** o cliente pediu acesso a canais.
> A gente entrega a camada zero da presença digital oficial.
> Base sobre a qual o site completo, a autoridade e a captação
> B2B serão construídos (ver fases no `dossie-tcpartners.md`).

────────────────────────────────────────

## ◬ 1 · Identidade da marca

> **Fonte:** Apresentacao_TC_Partners_Final.pdf
> **Atenção:** o `BRANDING.md` antigo tinha paleta errada
> (azul apagado `#0A2342`). Os valores abaixo foram amostrados
> da apresentação oficial e substituem os antigos.
> Atualizar `src/styles/tokens.css` e `BRANDING.md`.

### ⧉ O símbolo (ativo central)

- ícone construído das iniciais t + c, formando um "C" sólido
- no espaço negativo central, revela a proa de um navio
- semântica: transporte marítimo, logística, import/export
- memorável, geométrico, internacional
- serve favicon, ícone de app, splash, loader e máscara visual
- essa história é o coração da animação de entrada (ver §5)

### ⧉ Paleta oficial (HEX reais)

```text
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ TOKEN                  HEX        USO
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ Indigo (cor-mãe)       #3729BE    fundo chapado, ativo
┃ Indigo variante        #382DB8    cartões, superfícies
┃ Azul elétrico (topo)   #02B8F9    brilho, glow do símbolo
┃ Azul profundo (meio)   #001674    corpo do gradiente
┃ Quase-preto azulado    #000522    background, splash
┃ Branco                 #FFFFFF    símbolo, wordmark, texto
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Gradiente assinatura (símbolo / heros):

```text
radial-gradient(circle at 30% 20%,
  #02B8F9 0%, #2A1FC0 35%, #001674 70%, #000522 100%)
```

Background institucional (página):

```text
linear-gradient(160deg,
  #0A0726 0%, #000522 55%, #050218 100%)
+ glow índigo sutil no topo
```

### ⧉ Tipografia

- wordmark geométrica, minúscula (`tc partners`), peso forte
- aproximação web: Inter / Satoshi / General Sans
- fonte exata do manual deve ser confirmada com a agência

Assinatura tipográfica obrigatória: o underscore final.

```text
Parceiros para ir além das fronteiras_
importação e exportação_
tcpartners.com.br_
```

Esse `_` é detalhe de marca.
Carregar para a UI (pode piscar como cursor).

### ⧉ Aplicações vistas no manual

- símbolo "glass / liquid" com brilho azul (p.16)
  → referência pro tratamento premium do símbolo
- cartão de visita com QR code
  → ponte print→digital (ver §6)
- padrão de repetição do símbolo em baixa opacidade
  → textura de fundo opcional

────────────────────────────────────────

## ⧇ 2 · Dados do projeto

### ⧉ Identidade verbal

- **Nome de marca:** TC Partners
- **Razão social:** TC Importação e Exportação LTDA
- **CNPJ:** 24.825.654/0001-12 (ATIVA desde 17/05/2016)
- **Descrição curta:** Assessoria em Importação e Exportação
- **Assinatura:** Parceiros para ir além das fronteiras_
- **Base:** Itajaí · Santa Catarina · Brasil
  (polo portuário/logístico, vantagem estratégica, ver dossiê)

### ⧉ Canais oficiais

Confirmar com o cliente antes do deploy.

```text
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ CANAL       VALOR                          STATUS
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ Domínio     tcpartners.com.br              [...] DNS
┃ E-mail      comercial@tcpartners.com.br?   [...] confirmar
┃ Instagram   @?                             [...] confirmar
┃ LinkedIn    TC Partners                    [...] URL
┃ WhatsApp    +55 47 ...                     [...] confirmar
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### ⧉ Técnico

- **Stack:** Astro + TypeScript (já scaffoldado em `/src`)
- **PWA:** `astro-pwa` / manifest manual em `/public`
- **Hospedagem:** Cloudflare Pages
- **Analytics:** PostHog (eventos + funil)
- **Repositório:** monorepo CODIGOS
  → `projects/clientes/tc-partners-official-hub`

────────────────────────────────────────

## ⨀ 3 · Objetivo da página

Centralizar os canais oficiais da TC Partners numa única
experiência digital com cara de aplicativo, que comunique:

1. acesso rápido — e-mail, site, Instagram, LinkedIn, WhatsApp
2. credibilidade e presença oficial (não "em construção")
3. atuação internacional (comex) a partir de Itajaí
4. a identidade visual nova da marca, animada e fiel

────────────────────────────────────────

## ⧖ 4 · Arquitetura da experiência

```text
┏━ Splash (1.5–2.5s, skippável)
┃     símbolo C que revela o navio
┃
┗━ Tela principal (mobile-first, centralizada)
   ├─ símbolo + wordmark "tc partners"
   ├─ descrição: assessoria em importação e exportação_
   ├─ assinatura: Parceiros para ir além das fronteiras_
   ├─ grid de acessos (4 cards core + 1 opcional)
   ├─ linha de status (selo + relógio Itajaí + coordenadas)
   └─ rodapé: Itajaí · Santa Catarina · Brasil
```

Princípios:
- limpo, centralizado, mobile-first
- acesso em ≤ 1 toque
- nada compete com os cards

────────────────────────────────────────

## ◭ 5 · Direção visual e animação

### ⧉ Background

Não usar imagem pesada (erro do VECT).
Construir em CSS/SVG:

- gradiente índigo → preto azulado (§1)
- glow índigo sutil no topo
- linhas de rota internacional (marítima/aérea) em SVG,
  baixíssima opacidade, com leve "draw" animado
  → amarra em "ir além das fronteiras"
- noise/grain mediano para evitar banding
- opcional: grid de mundo quase invisível

### ⧉ Splash / entrada (o momento "wow")

A história da marca é a animação:

```text
└─ 1. tela #000522
└─ 2. contorno do "C" desenha-se (stroke draw, ~0.6s)
└─ 3. preenche em branco; navio aparece no negativo
      com glow azul elétrico passando (#02B8F9)
└─ 4. wordmark "tc partners" faz fade+blur → nítido
└─ 5. transição suave (scale 0.96→1) para a principal
```

Limites:
- duração total 1.5–2.5s
- skippável (toque/tecla)
- roda 1x por sessão (sessionStorage)
- respeita `prefers-reduced-motion`

### ⧉ Entrada do conteúdo (stagger)

Headline → subheadline → cards em sequência curta
→ status/rodapé por último.

### ⧉ Interação dos cards

Hover/touch:
- sobe 2px
- borda ganha brilho índigo sutil
- ícone faz micro-deslocamento
- clique com micro-feedback (e dispara evento analytics)

### ⧉ Limites (evita parecer template)

Sem neon exagerado.
Sem excesso de partículas.
Sem movimento agressivo.
Sem loading longo.
Sem "cyberpunk/web3 genérico".
Estética Apple-like / software premium internacional.

────────────────────────────────────────

## ◮ 6 · Cards de acesso

Core (o que o cliente pediu — 4):

```text
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ #  CARD                  AÇÃO                ÍCONE
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ 1  Site Oficial          abre domínio        globo/proa
┃ 2  E-mail Corporativo    mailto:             envelope
┃ 3  Instagram             nova aba            instagram
┃ 4  LinkedIn              nova aba            linkedin
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Opcional / recomendado (fechado: incluir):

- **WhatsApp** — Atendimento Comercial
- ação: link `wa.me` com mensagem pré-preenchida
  ("Olá, vim pelo hub oficial da TC Partners…")
- em comex, WhatsApp é o canal real de fechamento
- entra como 5º card

Cada card:
- título + subtexto curto + ícone + ação
- área toda clicável, alvo de toque ≥ 44px

────────────────────────────────────────

## ⨂ 7 · Camada "WOW" (o que ganha o cliente)

Tudo abaixo é leve, cabe na página simples,
e gera "eles pensaram nisso?".
Implementar em tiers. Começar pelo Tier 1.

### ⧉ Tier 1 — incluir já (fechado)

Alto impacto, baixo custo.

- **PWA instalável** — prompt sutil "Adicionar à tela inicial"
  → o cliente abre no celular e ganha um app
- **vCard / Salvar contato** — botão gera `.vcf`
  com e-mail, telefone, site e logo
  → 1 toque, contato salvo (ouro em feira de comex)
- **QR Code on-screen** — bridge print→digital
  (os cartões da marca já têm QR); some no mobile
- **Relógio local de Itajaí** + coordenadas discretas
  → reforça operação real, base física, fuso internacional
- **Selo "Presença Oficial"** com micro-check animado
  → mata o estigma "site em construção"

### ⧉ Tier 2 — diferencial forte (v2 / upsell)

- **Bilíngue PT / EN** (toggle)
  → comex tem interlocutor estrangeiro;
    vira inglês num toque = "internacional"
- **Analytics como produto** — dashboard simples
  (canal mais clicado, horários, origem)
  → vira reunião de follow-up = porta para o site completo
- **Open Graph dinâmico premium**
  → preview lindo ao colar o link no WhatsApp/LinkedIn

### ⧉ Tier 3 — visão de futuro (só no pitch)

- rota animada origem→destino real (Itajaí ↔ Shanghai)
- status "online/operando" em horário comercial
- captura de lead leve (newsletter)

────────────────────────────────────────

## ⧗ 8 · Copy base

```text
Headline:     tc partners
Subheadline:  assessoria em importação e exportação_
Assinatura:   Parceiros para ir além das fronteiras_
Selo:         Presença Oficial · Canais Oficiais (escolher 1)
Rodapé:       Itajaí · Santa Catarina · Brasil
CTA WhatsApp: Inicie uma conversa com a equipe comercial
PWA install:  Adicione o hub oficial à sua tela inicial
```

Tom: confiante, internacional, enxuto.
Sempre carregar o `_` final nas frases-assinatura.

────────────────────────────────────────

## ◱ 9 · PWA

- `manifest.json` válido
  (nome, short_name, theme `#3729BE`, bg `#000522`,
   display `standalone`)
- ícones múltiplos tamanhos, do símbolo vetorial real
  (não do PNG antigo)
- splash screens iOS/Android
- service worker: cache básico + fallback offline
  (página funciona offline = outro "wow")
- **Nome no celular:** TC Partners
- **Short name:** TC Partners
- safe-area iPhone respeitada (`env(safe-area-inset-*)`)

────────────────────────────────────────

## ◲ 10 · SEO / metadados

```text
Title:        TC Partners · Assessoria em Importação e Exportação
Description:  Portal oficial da TC Partners. Assessoria
              estratégica em importação e exportação a partir
              de Itajaí, Santa Catarina, Brasil.
              "Parceiros para ir além das fronteiras."
```

- **Open Graph / Twitter:** imagem 1200×630
  com símbolo + gradiente + assinatura
  (regenerar do vetor; validar `/public/og`)
- **Favicon:** símbolo C isolado, regenerar do vetor
  (o atual usa `#43449c`, trocar para `#3729BE`)
- `lang` correto + `hreflang` se Tier 2 (bilíngue) entrar
- JSON-LD `Organization` (nome, logo, endereço Itajaí,
  sameAs dos canais) → bônus de indexação

────────────────────────────────────────

## ◳ 11 · Stack e implementação

- **Astro + TypeScript** (já iniciado)
- zero JS desnecessário no cliente
- ilhas só onde precisa
  (splash, install prompt, relógio, toggle idioma)
- animação: CSS + Motion One pontual; SVG draw no símbolo
- ícones: SVGs próprios (símbolo) + Lucide (canais)

Estrutura atual já presente:

```text
src/
├── components/
│   ├── BackgroundMotion.astro
│   ├── SplashIntro.astro
│   ├── AccessGrid.astro
│   ├── AccessCard.astro
│   ├── PortalHeader.astro
│   └── OfficialStatus.astro
├── lib/
│   ├── analytics.ts
│   └── pwa.ts
└── data/
    └── links.ts
```

Alinhar este plano com o que já existe ao codar.

Deploy:
- Cloudflare Pages
- SSL automático
- domínio apontado

────────────────────────────────────────

## ◴ 12 · Analytics

Eventos:

```text
splash_skip          click_whatsapp
click_site           save_vcard
click_email          show_qr
click_instagram      lang_switch
click_linkedin       pwa_install_prompt
                     pwa_installed
```

Valor entregue ao cliente:
- canal mais clicado
- horários de pico
- origem do tráfego
- taxa de instalação do app

→ insumo da reunião que vende o site completo.

────────────────────────────────────────

## ◵ 13 · Checklist de entrega

```text
▓▓▓ PRÉ-REQUISITOS (cliente / agência)
────────────────────────────────────────
└─ [x] símbolo vetorial SVG (entregue, cor #3729BE OK)
└─ [x] wordmark PNG real (tc_partners.png, fonte oficial)
└─ [x] frase PNG real (frase.png, fonte oficial)
└─ [ ] confirmar número WhatsApp real
└─ [ ] confirmar handle Instagram
└─ [ ] confirmar URL LinkedIn
└─ [ ] confirmar e-mail comercial
└─ [ ] confirmar fonte oficial do manual
└─ [x] aprovar Tier 1 (fechado pelo owner)
```

```text
▓▓▓ DESIGN
────────────────────────────────────────
└─ [x] tokens corrigidos (#3729BE + gradiente azul→ciano)
└─ [x] splash stroke-draw C → navio no negativo
└─ [x] background CSS/SVG (rotas, glow, noise, degradê radial)
└─ [x] cards responsivos + hover/touch (translateY -2px, índigo, icon deslocamento)
└─ [x] logo C + wordmark PNG lado a lado (alinhamento topo)
└─ [x] status bar iPhone topo (local + coords + relógio + ícones)
└─ [x] mobile-first + desktop + safe-area iPhone
└─ [x] cursor _ piscando em #02B8F9 no brand-name
```

```text
▓▓▓ TÉCNICO
────────────────────────────────────────
└─ [x] PWA (manifest #3729BE, ícones novos, SW 278KB, offline)
└─ [x] splash screens iOS (22 tamanhos portrait)
└─ [x] vCard .vcf com avatar base64 (icon-192.png)
└─ [x] QR Code desktop-only (tcpartners.com.br)
└─ [x] PWA prompt canto direito (beforeinstallprompt + iOS fallback)
└─ [x] SEO + OG + JSON-LD Organization + favicon
└─ [x] analytics CustomEvent tc:click em todos os cards
└─ [ ] links reais confirmados pelo cliente
└─ [ ] deploy + domínio + SSL
└─ [ ] favicon.svg cor #3729BE (atual #43449c)
└─ [ ] og-image.png gerado (atual 0 bytes)
```

```text
▓▓▓ QUALIDADE
────────────────────────────────────────
└─ [ ] iPhone · Android · desktop (teste real no device)
└─ [ ] instalação PWA + teste offline
└─ [ ] Lighthouse > 95 (perf/SEO/bp/a11y)
└─ [ ] a11y (contraste, foco, reduced-motion, toque)
```

────────────────────────────────────────

## ⦿ 14 · Como apresentar (pitch)

Não dizer: "fiz uma página com 4 links."

Dizer:

> Estruturei a primeira presença digital oficial da
> TC Partners como um hub institucional — leve, rápido e
> instalável como aplicativo — usando a nova identidade:
> o símbolo que revela o navio, o gradiente azul-índigo e a
> assinatura "ir além das fronteiras". Centraliza todos os
> canais oficiais, salva o contato com um toque, funciona
> offline, abre em inglês para parceiros internacionais e
> mede cada acesso — virando um ativo estratégico, não só
> uma página. É a camada zero sobre a qual construímos o
> site completo e a autoridade digital.

Roteiro da demo:

```text
└─ abrir no celular        → splash do navio
└─ instalar como app       → "vira app?"
└─ salvar contato          → vCard 1 toque
└─ trocar pra inglês       → "fala inglês?"
└─ mostrar painel cliques  → ativo estratégico
```

Cada passo é um "não esperava isso".

────────────────────────────────────────

## ⍟ 15 · Decisões — status

Fechadas (owner, 2026-05-28):

- **Escopo v1:** Core + Tier 1
  (4 cards + WhatsApp, splash do navio, PWA, vCard, QR,
   relógio Itajaí, selo oficial)
  Tier 2 (bilíngue, painel) fica para v2 / upsell
- **WhatsApp:** incluir como 5º card
  (link `wa.me` + mensagem pré-preenchida)
- **Analytics:** PostHog
- **Hospedagem:** Cloudflare Pages

Ainda abertas (com cliente / agência):

1. selo: "Presença Oficial" vs "Canais Oficiais"
2. confirmar links oficiais + e-mail + número WhatsApp
3. conseguir vetores reais — feito (símbolo + wordmark SVG)
4. confirmar a fonte oficial do manual

────────────────────────────────────────

## ◬ 16 · Notas de assets (entregues)

```text
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ ARQUIVO                       STATUS
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ logos/tc-symbol.svg           OK vetor branco #fff
┃ logos/tc-symbol_indigo.svg    OK vetor índigo #3729be
┃ logos/tc-logo.svg             OK vetor branco #fff
┃ logos/tc-logo_indigo.svg      OK vetor índigo #3729be
┃ loco_full_transp.png          OK hero branco transparente
┃ png/icone_indigo.png          OK favicon/PWA
┃ png/logo_indigo.png           DEFEITO glifos p/ç sumiram
┃ metallic.png                  3D skeuomórfico, evitar
┃ favicon.svg (atual)           TROCAR cor #43449c, 2.1MB
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Regras:
- usar sempre os SVGs para logo/wordmark
- `logo_indigo.png` não serve (texto quebrado)
- `metallic.png` no máximo como easter-egg sutil
- regenerar favicon do símbolo vetorial com `#3729BE`

────────────────────────────────────────

```text
▓▓▓ NΞØ MELLØ
────────────────────────────────────────
Core Architect · NΞØ Protocol
neo@neoprotocol.space

"Code is law. Expand until
chaos becomes protocol."

Security by design.
Exploits find no refuge here.
────────────────────────────────────────
```
