---
to: ./<%= projectName %>/package.json
sh: cd <%= projectName %> && npx --yes sort-package-json && npm i
---
{
  "name": "<%= h.inflection.dasherize(projectName) %>",
  "version": "0.0.0",
  "description": "<%= description %>",
  "repository": "<%= repo %>",
  "main": "src/index.ts",
  "type": "module",
  "scripts": {
<% if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>
    "prettify": "prettier --write . --ignore-path ./.gitignore",
    "prettify:check": "prettier --check . --ignore-path ./.gitignore",
    "lint": "eslint --fix . && npm run prettify",
    "lint:check": "eslint . && npm run prettify:check",
<% } -%>
    "prepare": "husky install",
<% if (features.testing) { -%>
    "test": "NODE_OPTIONS='--import tsx' vitest",
    "coverage": "npm run test -- --coverage",
<% } -%>
    "start:dev": "tsx watch ./src/index.ts",
    "start": "tsx ./src/index.ts",
    "build": "rimraf dist && tsc",
<% if (features.changesets) { -%>
    "version": "npx changeset version && npm i",
<% } -%>
<% if (features.database) { -%>
    "typeorm": "NODE_OPTIONS='--import tsx' typeorm",
    "typeorm:generate": "npm run typeorm migration:generate ./src/db/migrations/migration -- -p -d ./src/data-source.ts",
    "typeorm:migrate": "npm run typeorm migration:run -- -d ./src/data-source.ts",
<% } -%>
    "type-check": "tsc --noEmit"
  },
  "author": "",
  "license": "GPL-3.0",
  "dependencies": {
<% if (features.express) { -%>
    "express": "^4.18.1",
<% } -%>
<% if (features.logging) { -%>
    "@rosen-bridge/callback-logger": "0.2.0",
    "@rosen-bridge/winston-logger": "1.1.0",
<% } -%>
<% if (features.database) { -%>
    "reflect-metadata": "^0.1.13",
    "sqlite3": "^5.0.8",
    "@rosen-bridge/extended-typeorm": "^0.2.1",
<% } -%>
    "config": "^3.3.7",
    "tsx": "^4.19.4"
  },
  "devDependencies": {
<% if (features.express) { -%>
    "@types/express": "^4.17.13",
<% } -%>
<% if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>
    "@typescript-eslint/eslint-plugin": "^8.43.0",
    "@typescript-eslint/parser": "^8.43.0",
    "eslint": "^9.35.0",
    "globals": "16.3.0",
    <% if (features.eslintFeaturesReact) { -%>
    "eslint-plugin-react-hooks": "^5.2.0",
    "eslint-plugin-react-refresh": "^0.4.20",
    <% } -%>
    "eslint-config-prettier": "^9.1.0",
    "prettier": "^3.2.4",
<% } -%>
<% if (features.testing) { -%>
    "@vitest/eslint-plugin": "^1.3.9",
    "@vitest/coverage-istanbul": "^3.1.4",
    "vitest": "^3.1.4",
<% } -%>
<% if (features.changesets) { -%>
    "@changesets/cli": "^2.27.1",
    "@rosen-bridge/changeset-formatter": "^1.1.0",
<% } -%>
    "@types/config": "^0.0.41",
    "husky": "^8.0.0",
    "lint-staged": "^13.0.3",
<% if (features.depcheck) { -%>
    "depcheck": "1.4.7",
<% } -%>
    "@types/node": "^20.11.9",
    "typescript": "^5.3.3"
  },
  "engines": {
    "node": ">=20.11.0"
  }
}
