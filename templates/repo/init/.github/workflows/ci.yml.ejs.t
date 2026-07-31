---
to: "<%= features.ciCdGithubActionsCi ? `./${projectName}/.github/workflows/ci.yml` : null %>"
---

name: CI

on:
  push:
    branches: ['dev']
  pull_request:
    types: [opened, synchronize, reopened]

jobs:
  ci:
    name: CI
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v6
        with:
          fetch-depth: 0

      - name: Setup Node
        uses: actions/setup-node@v6
        with:
          node-version-file: .nvmrc
          registry-url: 'https://registry.npmjs.org'

      - name: Setup npm ${{ vars.NPM_VERSION }}
        run: npm i -g npm@${{ vars.NPM_VERSION }}

      - name: Install Dependencies
        run: npm ci

      - name: Build
        run: npm run build
<% if (features.knip) { -%>

      - name: Knip
        run: npx knip --dependencies
<% } -%>

      - name: Type Check
        run: npm run type-check
<% if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>

      - name: Lint
        run: npm run lint:check
<% } -%>
<% if (features.testing) { -%>

      - name: Test
        run: npm run coverage
<% } -%>
<% if (features.changesets) { -%>

      - name: changeset
        run: |
          git fetch origin dev
          npx changeset status --since=origin/dev
<% } -%>
