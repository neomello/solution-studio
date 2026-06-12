# TC Partners Official Hub - Setup

## Requisitos

Ambiente principal:

- macOS
- Apple Silicon compativel
- Node.js preferencialmente gerenciado por mise
- PNPM como package manager oficial

## Instalar dependencias

```bash
make install
```

Equivalente direto:

```bash
pnpm install --ignore-workspace
```

Nao usar `pnpm install` puro neste diretorio. O projeto esta dentro do workspace superior `/Users/nettomello/CODIGOS`, e o PNPM sobe ate esse root quando a flag `--ignore-workspace` nao e usada.

## Rodar localmente

```bash
pnpm run dev
```

Servidor local padrao:

```text
http://localhost:4321
```

## Build de producao

```bash
pnpm run build
```

Saida esperada:

```text
dist/
```

## Preview local do build

```bash
pnpm run preview
```

## Deploy

Deploy oficial: cPanel.
Vercel nao e alvo operacional deste projeto.

Antes de publicar, validar:

```bash
pnpm run build
```

Nao publicar com canais pendentes tratados como definitivos.

Para cPanel, enviar o conteudo de `dist/` para `public_html/`.
Nao enviar a pasta `dist` como subpasta, e sim os arquivos dentro dela.

### Publicacao via cPanel

1. Rodar `pnpm run build`.
2. Compactar o conteudo de `dist/`, mantendo `index.html` na raiz do ZIP.
3. Abrir cPanel -> Gerenciador de arquivos.
4. Entrar em `public_html/`.
5. Fazer backup ou renomear arquivos antigos antes de substituir.
6. Enviar o ZIP.
7. Extrair dentro de `public_html/`.
8. Confirmar que `public_html/index.html`, `public_html/.htaccess`, `public_html/sw.js` e `public_html/_assets/` existem.
9. Confirmar que `public_html/robots.txt` e `public_html/sitemap.xml` existem.
10. Testar `https://tcpartners.com.br/`.

## Smoke test minimo

Apos `pnpm run dev` ou `pnpm run preview`, verificar:

- pagina inicial carrega sem erro
- logo aparece
- cards aparecem em mobile
- LinkedIn aponta para `https://www.linkedin.com/company/tc-partners-importacoes`
- WhatsApp aponta para `https://wa.me/5547992051159`
- Instagram aponta para `https://www.instagram.com/tcpartnerscomex`
- E-mail aponta para `mailto:candido@tcpartners.com.br`
- PWA manifest carrega
- favicon carrega de `public/favicon.svg`
- layout nao cria overflow horizontal em mobile

## Troubleshooting conhecido

Se houver divergencia entre documentacao antiga e estado atual, priorizar:

1. `package.json`
2. `AGENTS.md`
3. `CONTEXT.md`
4. decisao explicita mais recente do operador

O estado vigente deste projeto usa PNPM.

### Warning: Vite 8 detectado

Astro 6 requer Vite 7. Se aparecer:

```text
Vite 8.0.16 detected in your project.
Astro requires Vite 7.
```

Validar:

```bash
node -p "require('vite/package.json').version"
```

O contrato local deve manter:

- `devDependencies.vite` em `^7`
- `pnpm.overrides.vite` em `^7`

Como este pacote fica dentro de um workspace PNPM superior em `/Users/nettomello/CODIGOS`, usar instalacao local quando for preciso normalizar este no isoladamente:

```bash
pnpm install --ignore-workspace
```

### Erro MissingSharp no build

Se aparecer:

```text
MissingSharp: Could not find Sharp.
```

A causa e o pipeline do `astro:assets`, nao o tamanho do SVG.
O projeto usa o componente `Image` no logo do header, entao o build precisa de `sharp`.

Validar:

```bash
node -e "console.log(require('sharp/package.json').version)"
pnpm run build
```

O contrato local deve manter `devDependencies.sharp`.
