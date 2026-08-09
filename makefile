# Studio Odonto Official Hub - Makefile

# Package Manager
PM := pnpm

# Shell configuration
SHELL := /bin/zsh

# Text colors
CYAN    := \033[0;36m
GREEN   := \033[0;32m
RED     := \033[0;31m
YELLOW  := \033[0;33m
MAGENTA := \033[0;35m
RESET   := \033[0m

.DEFAULT_GOAL := help

.PHONY: help dev build preview verify deploy whoami cf-login cf-logout install clean repair check-node audit docs astro-sync check-pwa check-seo

check-node: ## Valida runtime Node.js >=22.12.0
	@node -e "const v=process.versions.node.split('.').map(Number);const ok=v[0]>22||(v[0]===22&&(v[1]>12||(v[1]===12&&v[2]>=0)));if(!ok){console.error('ERRO: Node.js >=22.12.0 requerido. Atual: '+process.versions.node);process.exit(1)}"

help: ## Exibe esta mensagem de ajuda resumida e organizada
	@echo "$(CYAN)========================================$(RESET)"
	@echo "$(CYAN)  STUDIO ODONTO · SOLUTION HUB TOOLSET $(RESET)"
	@echo "$(CYAN)========================================$(RESET)"
	@echo ""
	@echo "$(MAGENTA)🚀 COMANDOS PRINCIPAIS$(RESET)"
	@echo "  $(CYAN)make dev$(RESET)       Inicia o servidor de desenvolvimento local"
	@echo "  $(CYAN)make build$(RESET)     Gera o build estático de produção"
	@echo "  $(CYAN)make verify$(RESET)    Executa todas as verificações de contrato, PWA, SEO e build"
	@echo "  $(CYAN)make deploy$(RESET)    Verifica conta Cloudflare e faz deploy no Pages"
	@echo ""
	@echo "$(MAGENTA)☁️ CLOUDFLARE & CONTA$(RESET)"
	@echo "  $(CYAN)make whoami$(RESET)    Exibe a conta Cloudflare conectada atualmente"
	@echo "  $(CYAN)make cf-login$(RESET)  Realiza login no Cloudflare via terminal/navegador"
	@echo "  $(CYAN)make cf-logout$(RESET) Realiza logout do Cloudflare"
	@echo ""
	@echo "$(MAGENTA)🧹 MANUTENÇÃO & SETUP$(RESET)"
	@echo "  $(CYAN)make install$(RESET)   Instala e sincroniza dependências locais"
	@echo "  $(CYAN)make preview$(RESET)   Visualiza o build de produção localmente"
	@echo "  $(CYAN)make clean$(RESET)     Limpas pastas de build e artefatos temporários"
	@echo "  $(CYAN)make repair$(RESET)    Força reinstalação limpa das dependências"
	@echo ""

# ------------------------------------------------------------------------------
# 🚀 PRINCIPAIS
# ------------------------------------------------------------------------------

dev: ## Inicia o servidor de desenvolvimento
	@echo "$(CYAN)➜ Iniciando núcleo de desenvolvimento...$(RESET)"
	pnpm exec astro dev

build: ## Gera o build de produção
	@echo "$(CYAN)➜ Orquestrando build de produção...$(RESET)"
	pnpm exec astro build

preview: ## Visualiza o build de produção localmente
	@echo "$(CYAN)➜ Iniciando visualização do build...$(RESET)"
	pnpm exec astro preview

verify: check-node audit docs astro-sync check-pwa check-seo ## Executa auditorias, verificações de contrato e build
	@echo "$(CYAN)➜ Validando build de produção...$(RESET)"
	pnpm exec astro build
	@echo "$(GREEN)➜ Verificação de protocolo concluída com sucesso!$(RESET)"

deploy: whoami verify ## Confere a conta Cloudflare e faz deploy no Cloudflare Pages
	@echo "$(MAGENTA)========================================$(RESET)"
	@echo "$(MAGENTA)    NΞØ PROTOCOL · CLOUDFLARE DEPLOY    $(RESET)"
	@echo "$(MAGENTA)========================================$(RESET)"
	pnpm exec wrangler pages deploy dist --project-name studioodonto

# ------------------------------------------------------------------------------
# ☁️ CLOUDFLARE & CONTA
# ------------------------------------------------------------------------------

whoami: ## Checa qual conta do Cloudflare está conectada no momento
	@echo "$(CYAN)➜ Verificando conta conectada no Cloudflare...$(RESET)"
	@pnpm exec wrangler whoami

cf-login: ## Autentica / troca de conta no Cloudflare via navegador
	@echo "$(CYAN)➜ Conectando nova conta Cloudflare...$(RESET)"
	pnpm exec wrangler login

cf-logout: ## Desconecta a conta atual do Cloudflare
	@echo "$(CYAN)➜ Desconectando conta do Cloudflare...$(RESET)"
	pnpm exec wrangler logout

# ------------------------------------------------------------------------------
# ⚙️ VERIFICAÇÕES INTERNAS & CONTRATOS
# ------------------------------------------------------------------------------

docs:
	@echo "$(CYAN)➜ Validando documentos canônicos...$(RESET)"
	@test -d docs || (echo "$(RED)ERRO: Pasta docs/ não encontrada$(RESET)" && exit 1)
	@test -d .agents || (echo "$(RED)ERRO: Pasta .agents/ não encontrada$(RESET)" && exit 1)
	@echo "$(GREEN)➜ Estrutura de documentação validada.$(RESET)"

install:
	@echo "$(CYAN)➜ Sincronizando dependências com $(PM)...$(RESET)"
	$(PM) install --ignore-workspace

astro-sync:
	@echo "$(CYAN)➜ Sincronizando tipos do Astro...$(RESET)"
	pnpm exec astro sync

check-pwa: check-manifest check-sw check-js
	@echo "$(GREEN)➜ Contrato PWA validado.$(RESET)"

check-manifest:
	@echo "$(CYAN)➜ Validando manifest PWA...$(RESET)"
	@test -f public/site.webmanifest || (echo "$(RED)ERRO: public/site.webmanifest não encontrado$(RESET)" && exit 1)
	@node -e "const fs=require('fs');const m=JSON.parse(fs.readFileSync('public/site.webmanifest','utf8'));for(const k of ['name','short_name','start_url','scope','display','theme_color','background_color','icons']){if(!m[k]){console.error('ERRO: manifest sem '+k);process.exit(1)}}if(!Array.isArray(m.icons)||m.icons.length===0){console.error('ERRO: manifest sem icons');process.exit(1)}for(const icon of m.icons){const p='public'+icon.src.split('?')[0];if(!fs.existsSync(p)){console.error('ERRO: ícone ausente: '+p);process.exit(1)}}"
	@echo "$(GREEN)➜ Manifest validado.$(RESET)"

check-sw:
	@echo "$(CYAN)➜ Validando service worker...$(RESET)"
	@test -f src/lib/pwa.ts || (echo "$(RED)ERRO: src/lib/pwa.ts não encontrado$(RESET)" && exit 1)
	@rg -q "navigator\\.serviceWorker\\.register\\('/sw\\.js'\\)" src/lib/pwa.ts || (echo "$(RED)ERRO: registro /sw.js não encontrado$(RESET)" && exit 1)
	@rg -q "AstroPWA" astro.config.mjs || (echo "$(RED)ERRO: integração AstroPWA não encontrada$(RESET)" && exit 1)
	@rg -q "navigateFallback" astro.config.mjs || (echo "$(RED)ERRO: navigateFallback do PWA não encontrado$(RESET)" && exit 1)
	@echo "$(GREEN)➜ Service worker validado.$(RESET)"

check-js:
	@echo "$(CYAN)➜ Validando scripts client-side...$(RESET)"
	@test -f src/lib/analytics.ts || (echo "$(RED)ERRO: src/lib/analytics.ts não encontrado$(RESET)" && exit 1)
	@rg -q "CustomEvent\\('tc:click'" src || (echo "$(RED)ERRO: evento tc:click não encontrado$(RESET)" && exit 1)
	@! rg -n "console\\.(log|debug|warn|error)" src || (echo "$(RED)ERRO: console.* encontrado em src/$(RESET)" && exit 1)
	@echo "$(GREEN)➜ Scripts client-side validados.$(RESET)"

check-seo: check-robots
	@echo "$(CYAN)➜ Validando SEO base...$(RESET)"
	@test -f src/layouts/BaseLayout.astro || (echo "$(RED)ERRO: BaseLayout.astro não encontrado$(RESET)" && exit 1)
	@rg -q "<meta name=\"description\"" src/layouts/BaseLayout.astro || (echo "$(RED)ERRO: meta description ausente$(RESET)" && exit 1)
	@rg -q "<link rel=\"canonical\"" src/layouts/BaseLayout.astro || (echo "$(RED)ERRO: canonical ausente$(RESET)" && exit 1)
	@rg -q "og:image" src/layouts/BaseLayout.astro || (echo "$(RED)ERRO: Open Graph ausente$(RESET)" && exit 1)
	@rg -q "twitter:card" src/layouts/BaseLayout.astro || (echo "$(RED)ERRO: Twitter card ausente$(RESET)" && exit 1)
	@rg -q "application/ld\\+json" src/layouts/BaseLayout.astro || (echo "$(RED)ERRO: JSON-LD ausente$(RESET)" && exit 1)
	@echo "$(GREEN)➜ SEO base validado.$(RESET)"

check-robots:
	@echo "$(CYAN)➜ Validando robots.txt...$(RESET)"
	@test -f public/robots.txt || (echo "$(RED)ERRO: public/robots.txt não encontrado$(RESET)" && exit 1)
	@rg -q "^User-agent: \\*" public/robots.txt || (echo "$(RED)ERRO: robots.txt sem User-agent: *$(RESET)" && exit 1)
	@rg -q "^Allow: /" public/robots.txt || (echo "$(RED)ERRO: robots.txt sem Allow: /$(RESET)" && exit 1)
	@echo "$(GREEN)➜ robots.txt validado.$(RESET)"

clean:
	@echo "$(CYAN)➜ Limpando artefatos temporários e node_modules...$(RESET)"
	rm -rf dist/ .astro/ node_modules/

repair: clean
	@echo "$(RED)➜ EXECUTANDO REPARO...$(RESET)"
	$(PM) install --ignore-workspace
	$(PM) approve-builds
	@echo "$(GREEN)➜ Projeto reparado.$(RESET)"

audit:
	@echo "$(CYAN)➜ Executando auditoria de segurança...$(RESET)"
	$(PM) audit || true


