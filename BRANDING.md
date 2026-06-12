# DESIGN TOKENS — STUDIO ODONTO

> Paleta ajustada para a identidade visual oficial do Studio Odonto (Solution Odonto).
> Esta é a fonte de verdade. Manter sincronizado com `src/styles/tokens.css`.

---

## PALETA OFICIAL

### Ouro — cor-mãe (Accent)

Identidade central da marca, traz sofisticação e destaque aos elementos interativos.

```hex
HEX: #DB9E16
```

Uso:
- textos em destaque
- bordas e linhas
- estados ativos
- botões primários

---

### Fundo (Background) — Clean/Clínico

Tom bege claro muito suave, transmitindo higiene, limpeza e sofisticação leve.

```hex
HEX: #F7F5F0
```

Uso:
- fundo da página e da aplicação web

---

### Preto — Textos principais

Para garantir alto contraste sobre o fundo claro.

```hex
HEX: #000000
```

Uso:
- tipografia primária
- títulos
- ícones sólidos

---

### Superfícies e Cards (Glass / Sólido)

No tema claro, os cards podem ser brancos ou possuírem um leve tom translúcido sobre o bege `#F7F5F0`.

```css
Superfície: #FFFFFF
Borda: rgba(219, 158, 22, 0.2) /* Ouro com opacidade */
Sombra: 0 4px 20px rgba(0, 0, 0, 0.05)
```

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
| logo_horiz.svg             | OK                  | splash, header, etc       |
| logos/logo.png             | OK                  | metadados, fallback       |

---

## DIREÇÃO VISUAL

O visual deve parecer:

- clean e clínico, porém premium
- focado em saúde e estética dental
- elegante e claro

Nunca:

- escuro pesado (dark mode agressivo)
- corporativo de tecnologia
- "site em construção"
