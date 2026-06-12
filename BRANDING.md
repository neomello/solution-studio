# DESIGN TOKENS — TC PARTNERS

> Paleta amostrada do manual oficial (Apresentacao_TC_Partners_Final.pdf).
> Valores anteriores (#0A2342, #050816, #43449C) eram incorretos — substituídos.
> Esta é a fonte de verdade. Manter sincronizado com `src/styles/tokens.css`.

---

## PALETA OFICIAL

### Indigo — cor-mãe

Identidade central da marca. Usado em ativo, fundo chapado, cards.

```
HEX: #3729BE
Variante: #382DB8
```

Uso:

- fundo do símbolo e bg
- superfícies de cards
- estados ativos
- botões primários

---

### Azul Elétrico — accent / glow

Accent de energia. Usado com moderação extrema.

```hex
HEX: #02B8F9
```

Uso:

- glow do símbolo
- cursor piscante
- dot de status ativo
- hover de ícone
- rotas SVG de fundo
- relógio Itajaí

Nunca usar como fundo sólido. Nunca exagerar.

---

### Azul Profundo — corpo do gradiente

```hex
HEX: #001674
```

Uso:

- meio do gradiente radial do símbolo
- áreas de profundidade

---

### Fundo — quase-preto azulado

Base de toda a experiência. Splash screen.

```hex
HEX: #000522
```

---

### Branco — símbolo, wordmark, texto

```
HEX: #FFFFFF
```

Uso:

- símbolo TC (no fundo escuro)
- wordmark
- nuvens
- headlines
- ícones
- texto principal

---

### Glass Border

Bordas de cards e badges.

```
RGBA: rgba(255, 255, 255, 0.08)
```

---

### Glass Surface

Superfície translúcida dos cards.

```hex
RGBA: rgba(255, 255, 255, 0.04)
Backdrop blur: 20px
```

---

## GRADIENT SYSTEM

### Background institucional (página)

```css
linear-gradient(160deg, #0A0726 0%, #000522 55%, #050218 100%)
```

Com glow índigo sutil no topo:

```css
radial-gradient(ellipse at top, rgba(55, 41, 190, 0.22) 0%, rgba(2, 184, 249, 0.06) 40%, transparent 70%)
```

---

### Gradiente assinatura (símbolo / hero)

```css
radial-gradient(circle at 30% 20%,
  #02B8F9 0%, #2A1FC0 35%, #001674 70%, #000522 100%)
```

---

## SHADOW SYSTEM

### Card Shadow

```hex
0 10px 40px rgba(0, 0, 0, 0.4)
```

### Glow Shadow (símbolo)

```hex
0 0 30px rgba(2, 184, 249, 0.2)
```

Nunca exagerar glow.

---

## TYPOGRAPHY

### Font Family

```fonts
Primary: 'Inter', sans-serif
Alternative: 'Satoshi', sans-serif
```

### Heading

```
Weight: 600 → 700
Letter spacing: -0.03em → -0.04em
```

### Body

```
Weight: 400 → 500
Line height: 150%
```

### Assinatura de marca

O underscore final `_` é detalhe de identidade obrigatório.
Implementar como cursor piscando em `#02B8F9` nas frases-assinatura:

```
tc partners_
assessoria em importação e exportação_
Parceiros para ir além das fronteiras_
```

---

## SPACING SYSTEM

```
Base unit: 8px
Escala: 8 · 16 · 24 · 32 · 48 · 64
```

Nunca usar spacing fora da escala.

---

## RADIUS SYSTEM

```
Cards:   24px
Buttons: 18px
Pill:    999px
Ícones:  14px
```

---

## MOTION TOKENS

### Transition Fast

```
220ms cubic-bezier(0.22, 1, 0.36, 1)
```

### Transition Smooth

```
420ms cubic-bezier(0.22, 1, 0.36, 1)
```

### Splash

```
Duração total: 1.5–2.5s
Skippável: sim (toque ou tecla)
Roda: 1x por sessão (sessionStorage)
Respeita: prefers-reduced-motion
```

---

## SAFE AREA

Sempre respeitar (iPhone nativo):

```css
env(safe-area-inset-top)
env(safe-area-inset-bottom)
env(safe-area-inset-left)
env(safe-area-inset-right)
```

---

## REGRAS DE ASSETS

| Arquivo                    | Status              | Uso                       |
|----------------------------|---------------------|---------------------------|
| logos/tc-symbol.svg        | OK — branco #fff    | splash, header, favicon   |
| logos/tc-symbol_indigo.svg | OK — #3729be        | fundo claro (futuro)      |
| logos/tc-logo.svg          | OK — branco #fff    | splash wordmark           |
| logos/tc-logo_indigo.svg   | OK — #3729be        | fundo claro (futuro)      |
| favicon.svg (atual)        | SUBSTITUIR          | cor errada #43449c, 2.1MB |

Regras:

- Sempre usar SVG para logo e símbolo
- `logo_indigo.png` — não usar (glifos ç/p quebrados)
- `metallic.png` — não usar (skeuomórfico, fora da identidade)
- Regenerar favicon do símbolo vetorial com `#3729BE`

---

## DIREÇÃO VISUAL

O visual deve parecer:

- software premium internacional
- portal institucional sólido
- experiência Apple-like / nativa no iPhone
- elegante sem exagero

Nunca:

- cyberpunk
- web3 genérico
- startup neon exagerado
- template corporativo antigo
- "site em construção"
