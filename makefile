# Studio Odonto Official Hub - Makefile
# Standard: NΞØ Protocol Ecosystem — Makefile Visual Standard (v1 · 2026)

PM := pnpm
SHELL := /bin/zsh

CYAN    := \033[0;36m
GREEN   := \033[0;32m
RED     := \033[0;31m
YELLOW  := \033[0;33m
MAGENTA := \033[0;35m
DIM     := \033[0;90m
WHITE   := \033[1;37m
RESET   := \033[0m

.DEFAULT_GOAL := help
.PHONY: help check-node install dev build preview verify deploy commit whoami cf-login cf-logout docs astro-sync check-pwa check-manifest check-sw check-js check-seo check-robots clean repair audit

help: ## Exibe os comandos disponíveis
	@printf "$(CYAN)╔══════════════════════════════════════════╗$(RESET)\n"
	@printf "$(CYAN)║$(MAGENTA)▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓$(CYAN)║$(RESET)\n"
	@printf "$(CYAN)║                                          ║$(RESET)\n"
	@printf "$(CYAN)║$(RESET)     $(WHITE)STUDIO ODONTO · OFFICIAL HUB$(RESET)         $(CYAN)║$(RESET)\n"
	@printf "$(CYAN)║$(RESET)          $(MAGENTA)── v1.0.0 · Astro 7 ──$(RESET)           $(CYAN)║$(RESET)\n"
	@printf "$(CYAN)║                                          ║$(RESET)\n"
	@printf "$(CYAN)║$(MAGENTA)▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓$(CYAN)║$(RESET)\n"
	@printf "$(CYAN)╚══════════════════════════════════════════╝$(RESET)\n"
	@printf "$(DIM) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░$(RESET)\n"
	@printf "\n"
	@printf "  Uso: $(CYAN)make$(RESET) $(WHITE)[comando]$(RESET)\n"
	@printf "\n"
	@printf "$(DIM)  ·─── AMBIENTE ──────────────────────────────$(RESET)\n"
	@grep -E '^(check-node|install|repair|clean):.*## ' makefile \
		| sort \
		| awk 'BEGIN {FS = ":.*## "}; {printf "  \033[0;36m◆ %-16s\033[0m \033[0;90m%s\033[0m\n", $$1, $$2}'
	@printf "\n"
	@printf "$(DIM)  ·─── DESENVOLVIMENTO ───────────────────────$(RESET)\n"
	@grep -E '^(dev|build|preview):.*## ' makefile \
		| sort \
		| awk 'BEGIN {FS = ":.*## "}; {printf "  \033[0;36m◆ %-16s\033[0m \033[0;90m%s\033[0m\n", $$1, $$2}'
	@printf "\n"
	@printf "$(DIM)  ·─── QUALIDADE & SEGURANÇA ─────────────────$(RESET)\n"
	@grep -E '^(audit|docs|verify|commit|check-pwa|check-seo):.*## ' makefile \
		| sort \
		| awk 'BEGIN {FS = ":.*## "}; {printf "  \033[0;36m◆ %-16s\033[0m \033[0;90m%s\033[0m\n", $$1, $$2}'
	@printf "\n"
	@printf "$(DIM)  ·─── CLOUDFLARE & DEPLOY ────────────────────$(RESET)\n"
	@grep -E '^(deploy|whoami|cf-login|cf-logout):.*## ' makefile \
		| sort \
		| awk 'BEGIN {FS = ":.*## "}; {printf "  \033[0;36m◆ %-16s\033[0m \033[0;90m%s\033[0m\n", $$1, $$2}'
	@printf "\n"
	@printf "$(DIM) ─────────────────────────────────────────────$(RESET)\n"
	@printf "$(DIM) ⬡ NΞØ Protocol // Ecosystem // Studio Odonto Official Hub$(RESET)\n"
	@printf "\n"

check-node: ## Valida runtime Node.js >= 22.12.0
	@printf "$(CYAN)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(CYAN)│$(RESET)  $(WHITE)◉  CHECK-NODE$(RESET)                            $(CYAN)│$(RESET)\n"
	@printf "$(CYAN)╰──────────────────────────────────────────╯$(RESET)\n"
	@node -e "const v=process.versions.node.split('.').map(Number);const ok=v[0]>22||(v[0]===22&&(v[1]>12||(v[1]===12&&v[2]>=0)));if(!ok){console.error('ERRO: Node.js >=22.12.0 requerido. Atual: '+process.versions.node);process.exit(1)}"
	@printf "$(GREEN)  ✓ Node.js $(shell node -v) validado.$(RESET)\n"

install: ## Instala dependências locais isoladas
	@printf "$(CYAN)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(CYAN)│$(RESET)  $(WHITE)▼  INSTALL$(RESET)                               $(CYAN)│$(RESET)\n"
	@printf "$(CYAN)╰──────────────────────────────────────────╯$(RESET)\n"
	@$(PM) install --ignore-workspace || ($(PM) approve-builds --all && $(PM) rebuild)
	@printf "$(GREEN)  ✓ Instalação concluída com sucesso.$(RESET)\n"

dev: ## Inicia o servidor de desenvolvimento
	@printf "$(CYAN)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(CYAN)│$(RESET)  $(WHITE)▶  DEV$(RESET)                                   $(CYAN)│$(RESET)\n"
	@printf "$(CYAN)╰──────────────────────────────────────────╯$(RESET)\n"
	pnpm exec astro dev

build: ## Gera o build estático de produção
	@printf "$(CYAN)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(CYAN)│$(RESET)  $(WHITE)⬡  BUILD$(RESET)                                 $(CYAN)│$(RESET)\n"
	@printf "$(CYAN)╰──────────────────────────────────────────╯$(RESET)\n"
	pnpm exec astro build
	@printf "$(GREEN)  ✓ Build de produção concluído com sucesso.$(RESET)\n"

preview: ## Visualiza o build de produção localmente
	@printf "$(CYAN)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(CYAN)│$(RESET)  $(WHITE)◎  PREVIEW$(RESET)                               $(CYAN)│$(RESET)\n"
	@printf "$(CYAN)╰──────────────────────────────────────────╯$(RESET)\n"
	pnpm exec astro preview

audit: ## Varredura de vulnerabilidades de segurança
	@printf "$(CYAN)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(CYAN)│$(RESET)  $(WHITE)⚑  AUDIT$(RESET)                                 $(CYAN)│$(RESET)\n"
	@printf "$(CYAN)╰──────────────────────────────────────────╯$(RESET)\n"
	$(PM) audit || true
	@printf "$(GREEN)  ✓ Auditoria concluída.$(RESET)\n"

docs: ## Valida estrutura de documentação do repositório
	@printf "$(CYAN)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(CYAN)│$(RESET)  $(WHITE)✧  DOCS$(RESET)                                  $(CYAN)│$(RESET)\n"
	@printf "$(CYAN)╰──────────────────────────────────────────╯$(RESET)\n"
	@test -d docs || (printf "$(RED)  ✗ Pasta docs/ não encontrada$(RESET)\n" && exit 1)
	@test -d .agents || (printf "$(RED)  ✗ Pasta .agents/ não encontrada$(RESET)\n" && exit 1)
	@printf "$(GREEN)  ✓ Estrutura de documentação validada.$(RESET)\n"

astro-sync:
	@printf "$(CYAN)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(CYAN)│$(RESET)  $(WHITE)↑  ASTRO-SYNC$(RESET)                            $(CYAN)│$(RESET)\n"
	@printf "$(CYAN)╰──────────────────────────────────────────╯$(RESET)\n"
	pnpm exec astro sync
	@printf "$(GREEN)  ✓ Tipos do Astro sincronizados.$(RESET)\n"

check-pwa: check-manifest check-sw check-js ## Audita contrato PWA local
	@printf "$(GREEN)  ✓ Contrato PWA validado com sucesso.$(RESET)\n"

check-manifest:
	@printf "$(CYAN)  ➜ Validando manifest PWA...$(RESET)\n"
	@test -f public/site.webmanifest || (printf "$(RED)ERRO: public/site.webmanifest não encontrado$(RESET)\n" && exit 1)
	@node -e "const fs=require('fs');const m=JSON.parse(fs.readFileSync('public/site.webmanifest','utf8'));for(const k of ['name','short_name','start_url','scope','display','theme_color','background_color','icons']){if(!m[k]){console.error('ERRO: manifest sem '+k);process.exit(1)}}if(!Array.isArray(m.icons)||m.icons.length===0){console.error('ERRO: manifest sem icons');process.exit(1)}for(const icon of m.icons){const p='public'+icon.src.split('?')[0];if(!fs.existsSync(p)){console.error('ERRO: ícone ausente: '+p);process.exit(1)}}"
	@printf "$(GREEN)  ✓ Manifest PWA íntegro.$(RESET)\n"

check-sw:
	@printf "$(CYAN)  ➜ Validando service worker...$(RESET)\n"
	@test -f src/lib/pwa.ts || (printf "$(RED)ERRO: src/lib/pwa.ts não encontrado$(RESET)\n" && exit 1)
	@rg -q "navigator\\.serviceWorker\\.register\\('/sw\\.js'\\)" src/lib/pwa.ts || (printf "$(RED)ERRO: registro /sw.js não encontrado$(RESET)\n" && exit 1)
	@rg -q "AstroPWA" astro.config.mjs || (printf "$(RED)ERRO: integração AstroPWA não encontrada$(RESET)\n" && exit 1)
	@rg -q "navigateFallback" astro.config.mjs || (printf "$(RED)ERRO: navigateFallback do PWA não encontrado$(RESET)\n" && exit 1)
	@printf "$(GREEN)  ✓ Service worker validado.$(RESET)\n"

check-js:
	@printf "$(CYAN)  ➜ Validando scripts client-side...$(RESET)\n"
	@test -f src/lib/analytics.ts || (printf "$(RED)ERRO: src/lib/analytics.ts não encontrado$(RESET)\n" && exit 1)
	@rg -q "CustomEvent\\('tc:click'" src || (printf "$(RED)ERRO: evento tc:click não encontrado$(RESET)\n" && exit 1)
	@! rg -n "console\\.(log|debug|warn|error)" src || (printf "$(RED)ERRO: console.* encontrado em src/$(RESET)\n" && exit 1)
	@printf "$(GREEN)  ✓ Scripts client-side validados.$(RESET)\n"

check-seo: check-robots ## Verifica SEO básico e metadados
	@printf "$(CYAN)  ➜ Validando SEO base...$(RESET)\n"
	@test -f src/layouts/BaseLayout.astro || (printf "$(RED)ERRO: BaseLayout.astro não encontrado$(RESET)\n" && exit 1)
	@rg -q "<meta name=\"description\"" src/layouts/BaseLayout.astro || (printf "$(RED)ERRO: meta description ausente$(RESET)\n" && exit 1)
	@rg -q "<link rel=\"canonical\"" src/layouts/BaseLayout.astro || (printf "$(RED)ERRO: canonical ausente$(RESET)\n" && exit 1)
	@rg -q "og:image" src/layouts/BaseLayout.astro || (printf "$(RED)ERRO: Open Graph ausente$(RESET)\n" && exit 1)
	@rg -q "twitter:card" src/layouts/BaseLayout.astro || (printf "$(RED)ERRO: Twitter card ausente$(RESET)\n" && exit 1)
	@rg -q "application/ld\\+json" src/layouts/BaseLayout.astro || (printf "$(RED)ERRO: JSON-LD ausente$(RESET)\n" && exit 1)
	@printf "$(GREEN)  ✓ SEO base validado.$(RESET)\n"

check-robots:
	@printf "$(CYAN)  ➜ Validando robots.txt...$(RESET)\n"
	@test -f public/robots.txt || (printf "$(RED)ERRO: public/robots.txt não encontrado$(RESET)\n" && exit 1)
	@rg -q "^User-agent: \\*" public/robots.txt || (printf "$(RED)ERRO: robots.txt sem User-agent: *$(RESET)\n" && exit 1)
	@rg -q "^Allow: /" public/robots.txt || (printf "$(RED)ERRO: robots.txt sem Allow: /$(RESET)\n" && exit 1)
	@printf "$(GREEN)  ✓ robots.txt validado.$(RESET)\n"

verify: check-node audit docs astro-sync check-pwa check-seo ## Pipeline completo de verificação de protocolo e build
	@printf "$(CYAN)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(CYAN)│$(RESET)  $(WHITE)⬡  VERIFY$(RESET)                                $(CYAN)│$(RESET)\n"
	@printf "$(CYAN)╰──────────────────────────────────────────╯$(RESET)\n"
	pnpm exec astro build
	@printf "$(GREEN)  ✓ Verificação de protocolo concluída com sucesso!$(RESET)\n"

commit: verify ## Fluxo de commit seguro (Conventional Commits)
	@printf "$(MAGENTA)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(MAGENTA)│$(RESET)  $(WHITE)⬡  COMMIT$(RESET)                                $(MAGENTA)│$(RESET)\n"
	@printf "$(MAGENTA)╰──────────────────────────────────────────╯$(RESET)\n"
	@printf "$(YELLOW)  » Mensagem (Conventional Commits): $(RESET)"; \
	read -r msg; \
	git add -A && \
	git commit -m "$$msg" && \
	printf "$(MAGENTA)  ✓ Commit: $$msg$(RESET)\n"

deploy: whoami verify ## Confere conta Cloudflare e faz deploy no Pages
	@printf "$(MAGENTA)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(MAGENTA)│$(RESET)  $(WHITE)☁  CLOUDFLARE DEPLOY$(RESET)                    $(MAGENTA)│$(RESET)\n"
	@printf "$(MAGENTA)╰──────────────────────────────────────────╯$(RESET)\n"
	pnpm exec wrangler pages deploy dist --project-name studioodonto

whoami: ## Exibe a conta Cloudflare conectada atualmente
	@printf "$(CYAN)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(CYAN)│$(RESET)  $(WHITE)☁  WHOAMI$(RESET)                                $(CYAN)│$(RESET)\n"
	@printf "$(CYAN)╰──────────────────────────────────────────╯$(RESET)\n"
	@pnpm exec wrangler whoami

cf-login: ## Autentica ou troca de conta no Cloudflare via navegador
	@printf "$(CYAN)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(CYAN)│$(RESET)  $(WHITE)☁  CF-LOGIN$(RESET)                              $(CYAN)│$(RESET)\n"
	@printf "$(CYAN)╰──────────────────────────────────────────╯$(RESET)\n"
	pnpm exec wrangler login

cf-logout: ## Desconecta a conta atual do Cloudflare
	@printf "$(CYAN)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(CYAN)│$(RESET)  $(WHITE)☁  CF-LOGOUT$(RESET)                             $(CYAN)│$(RESET)\n"
	@printf "$(CYAN)╰──────────────────────────────────────────╯$(RESET)\n"
	pnpm exec wrangler logout

clean: ## Limpa pastas de build e artefatos temporários
	@printf "$(YELLOW)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(YELLOW)│$(RESET)  $(WHITE)✦  CLEAN$(RESET)                                 $(YELLOW)│$(RESET)\n"
	@printf "$(YELLOW)╰──────────────────────────────────────────╯$(RESET)\n"
	rm -rf dist/ .astro/ node_modules/
	@printf "$(GREEN)  ✓ Limpeza concluída.$(RESET)\n"

repair: clean ## Força reinstalação limpa de dependências
	@printf "$(YELLOW)╭──────────────────────────────────────────╮$(RESET)\n"
	@printf "$(YELLOW)│$(RESET)  $(WHITE)⚙  REPAIR$(RESET)                                $(YELLOW)│$(RESET)\n"
	@printf "$(YELLOW)╰──────────────────────────────────────────╯$(RESET)\n"
	$(PM) install --ignore-workspace
	$(PM) approve-builds
	@printf "$(GREEN)  ✓ Projeto reparado.$(RESET)\n"
