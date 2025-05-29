---
to: ./<%= servicePath %>/package.json
sh: cd <%= servicePath %> && npx --yes sort-package-json && npm i
---
{
  "name": "<%= h.inflection.dasherize(serviceName) %>",
  "version": "0.0.0",
  "description": "<%= description %>",
  "repository": "<%= repo %>",
  "main": "src/index.ts",
  "type": "module",
  "scripts": {
<% if (features.prettierEslint) { -%>
    "prettify": "prettier --write . --ignore-path ./.gitignore",
    "lint": "eslint --fix . && npm run prettify",
<% } -%>
<% if (features.testing) { -%>
    "test": "NODE_OPTIONS='--import tsx' vitest",
    "coverage": "npm run test -- --coverage",
<% } -%>
<% if (features.database) { -%>
    "typeorm": "NODE_OPTIONS='--import tsx' typeorm",
    "typeorm:generate": "npm run typeorm migration:generate ./src/db/migrations/migration -- -p -d ./src/data-source.ts",
    "typeorm:migrate": "npm run typeorm migration:run -- -d ./src/data-source.ts",
<% } -%>
    "start:dev": "tsx watch ./src/index.ts",
    "start": "tsx ./src/index.ts",
    "type-check": "tsc --noEmit"
  },
  "author": "<%= author %>",
  "license": "GPL-3.0",
  "dependencies": {
<% if (features.express) { -%>
    "express": "^4.18.1",
<% } -%>
<% if (features.logging) { -%>
    "@rosen-bridge/winston-logger": "^0.2.1",
<% } -%>
<% if (features.database) { -%>
    "reflect-metadata": "^0.1.13",
    "sqlite3": "^5.0.8",
    "typeorm": "^0.3.6",
<% } -%>
    "config": "^3.3.7",
    "tsx": "^4.19.4"
  },
  "devDependencies": {
<% if (features.prettierEslint) { -%>
    "@typescript-eslint/eslint-plugin": "^6.19.1",
    "@typescript-eslint/parser": "^6.19.1",
    "eslint": "^8.56.0",
    "eslint-config-prettier": "^9.1.0",
    "prettier": "^3.2.4",
<% } -%>
<% if (features.testing) { -%>
    "@vitest/coverage-istanbul": "^3.1.4",
    "vitest": "^3.1.4",
<% } -%>
    "@types/node": "^20.11.9",
    "typescript": "^5.3.3",
<% if (features.express) { -%>
    "@types/express": "^4.17.13",
<% } -%>
    "@types/config": "^0.0.41"
  }
}
