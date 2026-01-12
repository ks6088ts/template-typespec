# Logs

## Initialize a project

```shell
# Set up workspace
mkdir tmp
cd tmp

# Create a new TypeSpec project
tsp init \
  --template rest \
  --project-name template-typespec \
  --template-emitters @typespec/openapi3 \
  --template-emitters @typespec/http-server-js \
  --template-emitters @typespec/http-client-js \
  --template-emitters @typespec/http-client-python \
  --no-prompt

# Create a Git repository
git init
git add .
git commit -m "Initial Commit"

# Create a GitHub repository
gh repo create ks6088ts/template-typespec \
  --add-readme \
  --description "A GitHub template repository for TypeSpec" \
  --public \
  --source . \
  --push

# Edit GitHub repository settings
gh repo edit ks6088ts/template-typespec \
  --template \
  --delete-branch-on-merge

# Browse the GitHub repository
gh browse
```

## Use pnpm instead of npm

```shell
# Remove node_modules and package-lock.json
rm -rf node_modules package-lock.json

# Remove "packageManager": "npm@x.x.x" from package.json

pnpm install
```

## References

### TypeSpec

- [TypeSpec](https://github.com/Microsoft/typespec)
- [TypeSpec / Docs](https://typespec.io/docs/)
- [TypeSpec Extension in Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=typespec.typespec-vscode)
- [Client Emitters](https://typespec.io/docs/emitters/clients/introduction/)
- [TypeSpec HTTP server code generator for JavaScript](https://typespec.io/docs/emitters/servers/http-server-js/reference/)
- [TypeSpec MCP Server and Emitter](https://github.com/microsoft/typespec-mcp)
- [Resources for developing TypeSpec apps](https://learn.microsoft.com/en-us/azure/developer/typespec/resources)

### Usecases

- [APIs at Scale with TypeSpec by Mandy Whaley, Microsoft](https://www.youtube.com/watch?v=yfCYrKaojDo)
- [Azure REST API Specifications](https://github.com/Azure/azure-rest-api-specs)
- [freee > OpenAPI ではなく TypeSpec を読み書きするスキーマ駆動開発](https://developers.freee.co.jp/entry/typespec-install)
- [Developer Experienceの向上を目指して11万行のOpenAPI JSONをTypeSpecに移行した話](https://medium.com/eureka-engineering/developer-experience%E3%81%AE%E5%90%91%E4%B8%8A%E3%82%92%E7%9B%AE%E6%8C%87%E3%81%97%E3%81%A611%E4%B8%87%E8%A1%8C%E3%81%AEopenapi-json%E3%82%92typespec%E3%81%AB%E7%A7%BB%E8%A1%8C%E3%81%97%E3%81%9F%E8%A9%B1-f73449a6976b)
