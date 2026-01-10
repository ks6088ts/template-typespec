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

.PHONY: build
build: ## build applications
	tsp compile specification \
		--output-dir=./tsp-output \

.PHONY: ci-test
ci-test: install-deps-dev build ## run CI test

.PHONY: update
update: ## update dependencies
	pnpm update --latest
