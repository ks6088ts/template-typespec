# Git
GIT_REVISION ?= $(shell git rev-parse --short HEAD)
GIT_TAG ?= $(shell git describe --tags --abbrev=0 --always | sed -e s/v//g)

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help

.PHONY: install-deps-dev
install-deps-dev: ## install dependencies for development
	@which npm || echo "Please install Node.js and npm from https://nodejs.org/en/download/"
	@which pnpm || npm install -g pnpm
	@which tsp || npm install -g @typespec/compiler
	pnpm install

.PHONY: lint
lint: ## lint
	tsp format "**/*.tsp" --check

.PHONY: build
build: ## build applications
	tsp compile specification \
		--output-dir=./tsp-output \

.PHONY: ci-test
ci-test: install-deps-dev lint build ## run CI test

.PHONY: info
info: ## show information
	@echo "GIT_REVISION: $(GIT_REVISION)"
	@echo "GIT_TAG: $(GIT_TAG)"

.PHONY: fix
fix: ## apply auto-fixes
	tsp format "**/*.tsp"

.PHONY: update
update: ## update dependencies
	pnpm update --latest
