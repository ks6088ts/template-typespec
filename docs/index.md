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
