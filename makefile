# TC Partners Official Hub - Makefile

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

.PHONY: help install dev dev-open dev-port build build-verbose build-debug preview preview-open clean audit verify commit docs repair repair-lockfile update check-node astro-help astro-info astro-sync check-manifest check-sw check-js check-seo check-robots check-pwa

check-node: ## Valida runtime Node.js >=22.12.0
	@node -e "const v=process.versions.node.split('.').map(Number);const ok=v[0]>22||(v[0]===22&&(v[1]>12||(v[1]===12&&v[2]>=0)));if(!ok){console.error('ERRO: Node.js >=22.12.0 requerido. Atual: '+process.versions.node);process.exit(1)}"

help: ## Exibe esta mensagem de ajuda
	@echo "$(CYAN)========================================$(RESET)"
	@echo "$(CYAN)    NEO-PROTOCOL · ARCHITECT TOOLSET      $(RESET)"
	@echo "$(CYAN)========================================$(RESET)"
	@echo ""
	@echo "Uso: make [comando]"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(CYAN)%-15s$(RESET) %s\n", $$1, $$2}'

verify: check-node audit docs astro-sync check-pwa check-seo ## Executa verificações base (node + audit + docs + sync + pwa + seo + build)
	@echo "$(CYAN)➜ Validando build de produção...$(RESET)"
	pnpm exec astro build
	@echo "$(GREEN)➜ Verificação de protocolo concluída com sucesso!$(RESET)"

docs: ## Verifica a integridade das pastas de documentação e regras
	@echo "$(CYAN)➜ Validando documentos canônicos...$(RESET)"
	@test -d docs || (echo "$(RED)ERRO: Pasta docs/ não encontrada$(RESET)" && exit 1)
	@test -d .agents || (echo "$(RED)ERRO: Pasta .agents/ não encontrada$(RESET)" && exit 1)
	@test -d .codex || (echo "$(RED)ERRO: Pasta .codex/ não encontrada$(RESET)" && exit 1)
	@test -d .cursor/rules || (echo "$(RED)ERRO: Pasta .cursor/rules/ não encontrada$(RESET)" && exit 1)
	@echo "$(GREEN)➜ Estrutura de documentação validada.$(RESET)"

install: ## Instala as dependências do projeto
	@echo "$(CYAN)➜ Sincronizando dependências com $(PM)...$(RESET)"
	$(PM) install --ignore-workspace
	$(PM) rebuild

dev: ## Inicia o servidor de desenvolvimento
	@echo "$(CYAN)➜ Iniciando núcleo de desenvolvimento...$(RESET)"
	pnpm exec astro dev

dev-open: ## Inicia o Astro dev server abrindo o navegador
	@echo "$(CYAN)➜ Iniciando Astro em modo dev com navegador...$(RESET)"
	pnpm exec astro dev --open

dev-port: ## Inicia o Astro dev server em uma porta customizada: make dev-port PORT=8080
	@echo "$(CYAN)➜ Iniciando Astro na porta $${PORT:-4321}...$(RESET)"
	pnpm exec astro dev --port $${PORT:-4321}

build: ## Gera o build de produção
	@echo "$(CYAN)➜ Orquestrando build de produção...$(RESET)"
	pnpm exec astro build

build-verbose: ## Gera build com logs detalhados do Astro
	@echo "$(CYAN)➜ Orquestrando build com logs verbosos...$(RESET)"
	pnpm exec astro build --verbose

build-debug: ## Gera build com saída de desenvolvimento para investigar issues de build
	@echo "$(CYAN)➜ Orquestrando build debug do Astro...$(RESET)"
	pnpm exec astro build --devOutput --verbose

preview: ## Visualiza o build de produção localmente
	@echo "$(CYAN)➜ Iniciando visualização do build...$(RESET)"
	pnpm exec astro preview

preview-open: ## Visualiza o build local e abre o navegador
	@echo "$(CYAN)➜ Iniciando preview com navegador...$(RESET)"
	pnpm exec astro preview --open

astro-help: ## Lista comandos disponíveis da CLI Astro
	pnpm exec astro --help

astro-info: ## Mostra informações do ambiente Astro
	pnpm exec astro info

astro-sync: ## Sincroniza tipos e módulos gerados do Astro
	@echo "$(CYAN)➜ Sincronizando tipos do Astro...$(RESET)"
	pnpm exec astro sync

check-pwa: check-manifest check-sw check-js ## Audita contrato PWA local
	@echo "$(GREEN)➜ Contrato PWA validado.$(RESET)"

check-manifest: ## Verifica manifesto PWA e ícones declarados
	@echo "$(CYAN)➜ Validando manifest PWA...$(RESET)"
	@test -f public/site.webmanifest || (echo "$(RED)ERRO: public/site.webmanifest não encontrado$(RESET)" && exit 1)
	@node -e "const fs=require('fs');const m=JSON.parse(fs.readFileSync('public/site.webmanifest','utf8'));for(const k of ['name','short_name','start_url','scope','display','theme_color','background_color','icons']){if(!m[k]){console.error('ERRO: manifest sem '+k);process.exit(1)}}if(!Array.isArray(m.icons)||m.icons.length===0){console.error('ERRO: manifest sem icons');process.exit(1)}for(const icon of m.icons){const p='public'+icon.src.split('?')[0];if(!fs.existsSync(p)){console.error('ERRO: ícone ausente: '+p);process.exit(1)}}"
	@echo "$(GREEN)➜ Manifest validado.$(RESET)"

check-sw: ## Verifica configuração e registro do service worker
	@echo "$(CYAN)➜ Validando service worker...$(RESET)"
	@test -f src/lib/pwa.ts || (echo "$(RED)ERRO: src/lib/pwa.ts não encontrado$(RESET)" && exit 1)
	@rg -q "navigator\\.serviceWorker\\.register\\('/sw\\.js'\\)" src/lib/pwa.ts || (echo "$(RED)ERRO: registro /sw.js não encontrado$(RESET)" && exit 1)
	@rg -q "AstroPWA" astro.config.mjs || (echo "$(RED)ERRO: integração AstroPWA não encontrada$(RESET)" && exit 1)
	@rg -q "navigateFallback" astro.config.mjs || (echo "$(RED)ERRO: navigateFallback do PWA não encontrado$(RESET)" && exit 1)
	@echo "$(GREEN)➜ Service worker validado.$(RESET)"

check-js: ## Verifica scripts client-side críticos
	@echo "$(CYAN)➜ Validando scripts client-side...$(RESET)"
	@test -f src/lib/analytics.ts || (echo "$(RED)ERRO: src/lib/analytics.ts não encontrado$(RESET)" && exit 1)
	@rg -q "CustomEvent\\('tc:click'" src || (echo "$(RED)ERRO: evento tc:click não encontrado$(RESET)" && exit 1)
	@! rg -n "console\\.(log|debug|warn|error)" src || (echo "$(RED)ERRO: console.* encontrado em src/$(RESET)" && exit 1)
	@echo "$(GREEN)➜ Scripts client-side validados.$(RESET)"

check-seo: ## Verifica SEO básico no layout Astro
	@echo "$(CYAN)➜ Validando SEO base...$(RESET)"
	@test -f src/layouts/BaseLayout.astro || (echo "$(RED)ERRO: BaseLayout.astro não encontrado$(RESET)" && exit 1)
	@rg -q "<meta name=\"description\"" src/layouts/BaseLayout.astro || (echo "$(RED)ERRO: meta description ausente$(RESET)" && exit 1)
	@rg -q "<link rel=\"canonical\"" src/layouts/BaseLayout.astro || (echo "$(RED)ERRO: canonical ausente$(RESET)" && exit 1)
	@rg -q "og:image" src/layouts/BaseLayout.astro || (echo "$(RED)ERRO: Open Graph ausente$(RESET)" && exit 1)
	@rg -q "twitter:card" src/layouts/BaseLayout.astro || (echo "$(RED)ERRO: Twitter card ausente$(RESET)" && exit 1)
	@rg -q "application/ld\\+json" src/layouts/BaseLayout.astro || (echo "$(RED)ERRO: JSON-LD ausente$(RESET)" && exit 1)
	@$(MAKE) check-robots
	@echo "$(GREEN)➜ SEO base validado.$(RESET)"

check-robots: ## Verifica robots.txt público
	@echo "$(CYAN)➜ Validando robots.txt...$(RESET)"
	@test -f public/robots.txt || (echo "$(RED)ERRO: public/robots.txt não encontrado$(RESET)" && exit 1)
	@rg -q "^User-agent: \\*" public/robots.txt || (echo "$(RED)ERRO: robots.txt sem User-agent: *$(RESET)" && exit 1)
	@rg -q "^Allow: /" public/robots.txt || (echo "$(RED)ERRO: robots.txt sem Allow: /$(RESET)" && exit 1)
	@echo "$(GREEN)➜ robots.txt validado.$(RESET)"

clean: ## Limpa artefatos de build e node_modules (preserva lockfile)
	@echo "$(CYAN)➜ Limpando artefatos temporários e node_modules...$(RESET)"
	rm -rf dist/ .astro/ node_modules/

repair: clean ## Limpa node_modules e reinstala (preserva lockfile)
	@echo "$(RED)➜ EXECUTANDO REPARO...$(RESET)"
	rm -rf node_modules/
	$(PM) install --ignore-workspace
	@echo "$(GREEN)➜ Projeto reparado.$(RESET)"

repair-lockfile: clean ## Limpa TUDO incluindo lockfile (use apenas em último caso)
	@echo "$(RED)➜ REPARO TOTAL COM RESET DO LOCKFILE...$(RESET)"
	rm -rf node_modules/ pnpm-lock.yaml
	$(PM) install --ignore-workspace
	@echo "$(GREEN)➜ Projeto reparado com lockfile regenerado.$(RESET)"

update: ## Atualiza o Astro e todas as dependências
	@echo "$(CYAN)➜ Atualizando dependências...$(RESET)"
	$(PM) dlx @astrojs/upgrade -y
	$(PM) install --ignore-workspace --no-frozen-lockfile

audit: ## Executa auditoria de segurança
	@echo "$(CYAN)➜ Executando auditoria de segurança...$(RESET)"
	$(PM) audit || true

commit: verify ## Fluxo NΞØ Protocol: Verifica, Adiciona, Comita e Faz Push (Branch Atual)
	@echo "$(MAGENTA)========================================$(RESET)"
	@echo "$(MAGENTA)    NΞØ PROTOCOL · SECURE COMMIT        $(RESET)"
	@echo "$(MAGENTA)========================================$(RESET)"
	git status
	@echo "$(CYAN)➜ Adicionando mudanças...$(RESET)"
	git add .
	@echo "$(YELLOW)Digite a mensagem de commit (Conventional Commits):$(RESET)"
	@read msg; git commit -m "$$msg"
	@echo "$(CYAN)➜ Fazendo push para a branch atual...$(RESET)"
	git push origin $$(git rev-parse --abbrev-ref HEAD)
	@echo "$(GREEN)➜ Operação concluída com sucesso.$(RESET)"
