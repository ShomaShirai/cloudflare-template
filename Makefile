SHELL := /bin/bash
APP_DIR := cloudflare
NPM := npm --prefix $(APP_DIR)
WRANGLER_ENV := XDG_CONFIG_HOME=$(CURDIR)/.wrangler-config

.PHONY: help install dev preview preview-remote build deploy dry-run typecheck
.PHONY: db-generate db-migrate-local db-migrate-remote db-migrate

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
	@echo "  make db-migrate-local   - Apply D1 migrations locally"
	@echo "  make db-migrate-remote  - Apply D1 migrations remotely"
	@echo "  make db-migrate         - Alias of db-migrate-local"

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

db-migrate-local:
	$(WRANGLER_ENV) $(NPM) run db:migrate:local

db-migrate-remote:
	$(WRANGLER_ENV) $(NPM) run db:migrate:remote

db-migrate: db-migrate-local
