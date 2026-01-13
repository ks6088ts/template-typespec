[![test](https://github.com/ks6088ts/template-typespec/actions/workflows/test.yaml/badge.svg?branch=main)](https://github.com/ks6088ts/template-typespec/actions/workflows/test.yaml?query=branch%3Amain)
[![release](https://github.com/ks6088ts/template-typespec/actions/workflows/release.yaml/badge.svg?branch=main)](https://github.com/ks6088ts/template-typespec/actions/workflows/release.yaml?query=branch%3Amain)

# template-typespec

A GitHub template repository for TypeSpec

## Prerequisites

- [Node.js](https://nodejs.org/en/download)
- [pnpm](https://pnpm.io/installation)
- [GNU Make](https://www.gnu.org/software/make/)

## Development instructions

### Local development

Use Makefile to run the project locally.

```shell
# help
make

# install dependencies for development
make install-deps-dev

# build applications
make build

# run CI tests
make ci-test
```
