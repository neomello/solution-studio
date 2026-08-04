<!-- markdownlint-disable MD003 MD007 MD013 MD022 MD023 MD025 MD029 MD032 MD033 MD034 -->
# BRANDING

```text
========================================
    STUDIO ODONTO · BRANDING TOKENS
========================================
Status: ACTIVE
Version: v1.0.0
========================================
```

> **Cliente:** Studio Odonto (Solution Odonto)
> **Fonte de Verdade:** `src/styles/tokens.css`
> **Aplicação:** Identidade Visual, Tokens e UI

────────────────────────────────────────

## ⟠ Objetivo

Este documento estabelece a fonte canônica da identidade visual,
paleta de cores, tipografia e tokens de design do Studio Odonto.

Manter este arquivo estritamente sincronizado com
`src/styles/tokens.css`.

────────────────────────────────────────

## ⨷ Paleta Oficial

### 1. Ouro (#DB9E16) — Accent / Cor-mãe

Cor central da marca. Transmite sofisticação e destaque
aos elementos interativos e linhas de apoio.

```text
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ TOKEN               VALOR HEX / RGBA        USO
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ Accent Primary      #DB9E16                 textos, bordas, botões
┃ Accent Hover/Alt    #C38A12                 estado hover/active
┃ Glass Border        rgba(219, 158, 22, 0.2) borda de cards
┃ Glow Radial         rgba(219, 158, 22, 0.15) brilhos de fundo
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 2. Fundo (#F7F5F0) — Clean / Clínico

Tom bege claro muito suave, transmitindo higiene, limpeza
e estética clínica premium.

```text
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ TOKEN               VALOR HEX               USO
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ Background Clean    #F7F5F0                 fundo principal da app
┃ Surface Card        #FFFFFF                 superfície de cards
┃ Surface Secondary   #EBE7DF                 elementos de apoio
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 3. Preto (#000000) — Tipografia Primária

Proporciona alto contraste e legibilidade sobre o fundo claro.

```text
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ TOKEN               VALOR HEX               USO
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ Text Primary        #000000                 títulos, corpo de texto
┃ Icon Solid          #000000                 ícones e vetor primário
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 4. Superfícies e Degradês CSS

```css
--color-bg: #F7F5F0;
--color-indigo: #DB9E16;
--color-indigo-alt: #C38A12;
--color-navy: #EBE7DF;
--color-white: #000000;
--color-glass-border: rgba(219, 158, 22, 0.2);
--color-glass-surface: rgba(255, 255, 255, 0.7);

--gradient-bg: linear-gradient(160deg, #FFFFFF 0%, #F7F5F0 55%, #EBE7DF 100%);
--gradient-symbol: radial-gradient(circle at 30% 20%, #DB9E16 0%, #B8820F 35%, #000000 100%);
--gradient-glow: radial-gradient(ellipse at top, rgba(219, 158, 22, 0.15) 0%, transparent 60%);

--shadow-card: 0 4px 20px rgba(0, 0, 0, 0.05);
--shadow-glow: 0 0 30px rgba(219, 158, 22, 0.15);
```

────────────────────────────────────────

## ⧉ Tipografia

```text
▓▓▓ ESPECIFICAÇÃO TIPOGRÁFICA
────────────────────────────────────────
└─ Fonte Primária : 'Inter', sans-serif
└─ Fonte Alternat : 'Satoshi', sans-serif
└─ Headings       : Weight 600 → 700 | Letter Spacing -0.03em → -0.04em
└─ Corpo de Texto : Weight 400 → 500 | Line Height 150%
```

────────────────────────────────────────

## ⍟ Sistema de Espaçamento e Raio

### Escala de Espaçamento (Base 8px)

```text
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ ESCALA              VALOR ABSOLUTO          CSS TOKEN
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ Space 1             8px                     var(--space-1)
┃ Space 2             16px                    var(--space-2)
┃ Space 3             24px                    var(--space-3)
┃ Space 4             32px                    var(--space-4)
┃ Space 6             48px                    var(--space-6)
┃ Space 8             64px                    var(--space-8)
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Regra: Nunca utilizar espaçamento fora da escala base de 8px.

### Sistema de Arredondamento (Radius)

```text
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ ELEMENTO            VALOR RAIO              CSS TOKEN
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ Cards               24px                    var(--radius-card)
┃ Botões              18px                    var(--radius-btn)
┃ Pílula / Badges     999px                   var(--radius-pill)
┃ Ícones              14px                    --
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

────────────────────────────────────────

## ◬ Animações e Safe Area

### Animações (Motion Tokens)

```text
▓▓▓ MOTION & TRANSIÇÕES
────────────────────────────────────────
└─ Fast   : 220ms cubic-bezier(0.22, 1, 0.36, 1)
└─ Smooth : 420ms cubic-bezier(0.22, 1, 0.36, 1)
└─ Splash : Duração 1.5s–2.5s | 1x por sessão (sessionStorage)
```

### Safe Area iOS / Mobile

```css
env(safe-area-inset-top)
env(safe-area-inset-bottom)
env(safe-area-inset-left)
env(safe-area-inset-right)
```

────────────────────────────────────────

## ⨀ Ativos de Marca

```text
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ ARQUIVO                     STATUS          USO OFICIAL
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ public/logo_horiz.svg       OK              splash, header e hero
┃ public/logos/logo.png       OK              metadados e fallback
┃ public/favicon.svg          OK              favicon do navegador
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

────────────────────────────────────────

## ◮ Direção Visual & Diretrizes

```text
▓▓▓ DIRETRIZES ESTÉTICAS
────────────────────────────────────────
└─ Clean e clínico, porém premium
└─ Focado em saúde, bem-estar e estética dental
└─ Elegante, luminoso e de alto contraste
```

Proibições visuais:
- Não utilizar temas escuros agressivos (dark mode pesado).
- Não utilizar estética de empresa de tecnologia / SaaS.
- Nunca apresentar visual de "site em construção".

────────────────────────────────────────

## ⍟ Fechamento

```text
▓▓▓ STUDIO ODONTO
────────────────────────────────────────
Official Brand System · Solution Odonto
https://studioodonto.xyz
────────────────────────────────────────
```
