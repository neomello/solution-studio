<!-- markdownlint-disable MD003 MD007 MD013 MD022 MD023 MD025 MD029 MD032 MD033 MD034 -->
# SETUP

```text
========================================
     STUDIO ODONTO · PROJECT SETUP
========================================
Status: ACTIVE
Version: v1.0.0
========================================
```

## ⟠ Requisitos

Ambiente de desenvolvimento principal:

- macOS (Apple Silicon compatível)
- Node.js preferencialmente gerenciado via `mise` (versão >= 22.12.0)
- PNPM como package manager oficial (versão >= 11)

────────────────────────────────────────

## ⧉ Instalação & Execução

### 1. Instalar dependências

```bash
make install
```

> [!NOTE]
> Equivale a executar `pnpm install --ignore-workspace` seguido de `pnpm rebuild`. Não use `pnpm install` puro neste diretório para evitar subir ao workspace do diretório pai.

### 2. Executar em modo desenvolvimento

```bash
make dev
```

O servidor local de desenvolvimento ficará acessível em: `http://localhost:4321`

### 3. Gerar build de produção

```bash
make build
```

A saída de build estático será gerada no diretório: `dist/`

### 4. Visualizar o build de produção localmente

```bash
make preview
```

────────────────────────────────────────

## ◬ Deploy cPanel

O deploy oficial deste hub digital é realizado via cPanel. A Vercel/Netlify não são alvos de deploy deste projeto.

### Processo de Publicação via cPanel

1. Execute `make build` localmente.
2. Compacte o conteúdo gerado dentro do diretório `dist/` (assegure que `index.html` esteja na raiz do ZIP).
3. No painel do cPanel, abra o **Gerenciador de arquivos** e vá para a pasta `public_html/`.
4. Faça backup/renomeie a pasta antiga antes de substituições destrutivas.
5. Envie e extraia o arquivo ZIP dentro de `public_html/`.
6. Confirme a existência física dos arquivos críticos:
   - `public_html/index.html`
   - `public_html/.htaccess`
   - `public_html/sw.js`
   - `public_html/_assets/` (pasta de assets compilados)
   - `public_html/robots.txt`
   - `public_html/sitemap-index.xml` (ou `sitemap.xml`)
7. Teste o acesso de ponta a ponta na URL de produção: `https://studioodonto.xyz/`

────────────────────────────────────────

## ◉ Smoke Test

Após iniciar o servidor (`make dev` ou `make preview`), valide manualmente os itens:

- A página inicial carrega livre de erros de console.
- A logo do cabeçalho renderiza perfeitamente.
- O layout se comporta de forma totalmente responsiva (sem overflow horizontal em mobile).
- O botão do WhatsApp redireciona para `https://wa.me/5562992672199`.
- O link do Instagram aponta para `https://www.instagram.com/solutionodonto/`.
- O e-mail corporativo aponta para `mailto:lucieneleao@studioodonto.xyz`.
- O manifesto PWA e o service worker carregam/registram sem erros de rede.
- O favicon renderiza corretamente a partir de `/favicon.svg`.

────────────────────────────────────────

## ⚙ Troubleshooting

Se houver divergências ou erros durante a execução, verifique as resoluções abaixo:

### 1. Compatibilidade Astro 7 + Vite 8
Astro 7.x requer **Vite 8** para funcionar corretamente devido à nova arquitetura integrada com o Rolldown. Não force versões antigas de `vite` (ex: `^7`) no `package.json` ou via `overrides` de workspace, caso contrário o build quebrará com o erro:
`rollupOptions.input should not be an html file when building for SSR`.

### 2. Erros de script de build ignorados no PNPM v11 (`[ERR_PNPM_IGNORED_BUILDS]`)
Por estar dentro de uma subpasta de um workspace, rodamos a instalação com a flag `--ignore-workspace`. Com isso, o pnpm v11 ignora o `pnpm-workspace.yaml` onde estaria a liberação dos scripts de compilação.
- **Resolução**: Mantemos `strict-dep-builds=false` no arquivo `.npmrc` local para impedir o travamento e executamos o `pnpm rebuild` de forma sequencial logo após a instalação de dependências. Utilize sempre `make install` para automatizar esse fluxo.

### 3. Erro `MissingSharp` no build
Caso o build apresente a mensagem `MissingSharp: Could not find Sharp`, certifique-se de que a dependência opcional `sharp` está instalada e compilada. O projeto consome o componente `<Image />` do Astro para o logotipo, exigindo o `sharp` ativo no ambiente do Node.
