SHELL := /bin/bash
APP_DIR := cloudflare
NPM := npm --prefix $(APP_DIR)
WRANGLER_ENV := XDG_CONFIG_HOME=$(CURDIR)/.wrangler-config
DB_BINDING := DB

.PHONY: help install dev preview preview-remote build deploy dry-run typecheck
.PHONY: db-generate apply current rollback
.PHONY: db-migrate-local db-migrate-remote db-migrate

help:
	@echo "Available targets:"
	@echo "  make install            - Install app dependencies"
	@echo "  make dev                - Start React Router dev server"
	@echo "  make preview            - Start Wrangler local preview"
	@echo "  make preview-remote     - Start Wrangler remote preview"
	@echo "  make build              - Build for production"
	@echo "  make deploy             - Deploy to Cloudflare"
	@echo "  make dry-run            - Check deploy size without deploying"
	@echo "  make typecheck          - Run full type checks"
	@echo "  make db-generate        - Generate Drizzle migrations"
	@echo "  make apply              - Apply D1 migrations locally"
	@echo "  make current            - Show applied migration versions (local)"
	@echo "  make rollback TO=<ts>   - Roll back remote DB by timestamp via Time Travel"

install:
	$(NPM) install

dev:
	$(NPM) run dev

preview:
	$(WRANGLER_ENV) $(NPM) run preview

preview-remote:
	$(WRANGLER_ENV) $(NPM) run preview-remote

build:
	$(NPM) run build

deploy:
	$(WRANGLER_ENV) $(NPM) run deploy

dry-run:
	$(WRANGLER_ENV) $(NPM) run dry-run

typecheck:
	$(WRANGLER_ENV) $(NPM) run typecheck

db-generate:
	$(NPM) run db:generate

apply:
	$(WRANGLER_ENV) $(NPM) run db:migrate:local

current:
	$(WRANGLER_ENV) npx --prefix $(APP_DIR) wrangler --cwd $(APP_DIR) d1 execute $(DB_BINDING) --local --command "SELECT * FROM d1_migrations ORDER BY id DESC;"

rollback:
ifndef TO
	$(error TO is required. Usage: make rollback TO=2026-03-23T00:00:00Z)
endif
	$(WRANGLER_ENV) npx --prefix $(APP_DIR) wrangler --cwd $(APP_DIR) d1 time-travel restore $(DB_BINDING) --timestamp "$(TO)"

db-migrate-remote:
	$(WRANGLER_ENV) $(NPM) run db:migrate:remote
