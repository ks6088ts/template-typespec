# Git
GIT_REVISION ?= $(shell git rev-parse --short HEAD)
GIT_TAG ?= $(shell git describe --tags --abbrev=0 --always | sed -e s/v//g)

# Parameters
TSP_DIR ?= ./specifications
OUTPUT_DIR ?= ./tsp-output
OPENAPI_SPEC_YAML ?= $(OUTPUT_DIR)/schemas/openapi.yaml
OPENAPI_SPEC_YAML_BASE ?= $(OPENAPI_SPEC_YAML)

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help

.PHONY: install-deps-dev
install-deps-dev: ## install dependencies for development
	@command -v npm > /dev/null || echo "Please install Node.js and npm from https://nodejs.org/en/download/"
	@command -v pnpm > /dev/null || npm install -g pnpm
	pnpm install

.PHONY: lint
lint: ## lint
	pnpm exec cspell "**/*.tsp" --config cspell.config.yaml
	pnpm exec tsp format "**/*.tsp" --check

.PHONY: build
build: ## build applications
	pnpm exec tsp compile $(TSP_DIR) \
		--output-dir=$(OUTPUT_DIR)

.PHONY: build-watch
build-watch: ## build applications in watch mode
	pnpm exec tsp compile $(TSP_DIR) \
		--output-dir=$(OUTPUT_DIR) \
		--watch

.PHONY: ci-test
ci-test: install-deps-dev lint build ## run CI test

.PHONY: info
info: ## show information
	@echo "GIT_REVISION: $(GIT_REVISION)"
	@echo "GIT_TAG: $(GIT_TAG)"

.PHONY: fix
fix: ## apply auto-fixes
	pnpm exec tsp format "**/*.tsp"

.PHONY: update
update: ## update dependencies
	pnpm update --latest

.PHONY: clean
clean: ## clean output directory
	rm -rf $(OUTPUT_DIR)

.PHONY: tsp-openapi3
tsp-openapi3: ## convert OpenAPI3 to TypeSpec
	pnpm exec tsp-openapi3 $(OPENAPI_SPEC_YAML) --output-dir $(OUTPUT_DIR)/tsp

.PHONY: cspell-update-dictionary
cspell-update-dictionary: ## update cspell dictionary (ref. https://cspell.org/docs/getting-started)
	pnpm exec cspell --words-only --unique "**/*.tsp" | sort --ignore-case >> project-words.txt

.PHONY: oasdiff-breaking
oasdiff-breaking: ## display breaking changes between two OpenAPI specifications
	oasdiff breaking $(OPENAPI_SPEC_YAML_BASE) $(OPENAPI_SPEC_YAML) \
		--fail-on ERR

.PHONY: oasdiff-changelog
oasdiff-changelog: ## display changes between two OpenAPI specifications
	oasdiff changelog $(OPENAPI_SPEC_YAML_BASE) $(OPENAPI_SPEC_YAML) \
		--fail-on ERR
