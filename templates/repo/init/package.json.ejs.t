---
to: ./<%= projectName %>/package.json
sh: cd <%= projectName %> && npx --yes sort-package-json && npm i
---
{
  "name": "<%= h.inflection.dasherize(projectName) %>",
  "version": "0.0.0",
  "description": "<%= description %>",
  "repository": "<%= repo %>",
  "main": "dist/index.js",
  "type": "module",
  "scripts": {
<% if (features.prettierEslint) { -%>
    "prettify": "prettier --write . --ignore-path ./.gitignore",
    "lint": "eslint --fix . && npm run prettify",
<% } -%>
    "prepare": "husky install",
<% if (features.testing) { -%>
    "test": "NODE_OPTIONS=--loader=extensionless vitest",
    "coverage": "npm run test -- --coverage",
<% } -%>
    "start": "node --watch --loader ./ts-node-esm-loader.js --loader extensionless ./src/index.ts",
    "start:prod": "node --loader extensionless ./dist/index.js",
    "build": "rimraf dist && tsc",
<% if (features.changesets) { -%>
    "version": "npx changeset version && npm i",
<% } -%>
<% if (features.database) { -%>
    "typeorm": "NODE_OPTIONS=--experimental-specifier-resolution=node typeorm-ts-node-esm",
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
    "@rosen-bridge/winston-logger": "^0.2.1",
<% } -%>
<% if (features.database) { -%>
    "reflect-metadata": "^0.1.13",
    "sqlite3": "^5.0.8",
    "typeorm": "^0.3.6",
<% } -%>
    "config": "^3.3.7"
  },
  "devDependencies": {
<% if (features.express) { -%>
    "@types/express": "^4.17.13",
<% } -%>
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
<% if (features.changesets) { -%>
    "@changesets/cli": "^2.27.1",
    "@rosen-bridge/changeset-formatter": "^0.1.0",
<% } -%>
    "extensionless": "^1.9.6",
    "@types/config": "^0.0.41",
    "husky": "^8.0.0",
    "lint-staged": "^13.0.3",
    "ts-node": "^10.7.0",
    "@types/node": "^20.11.9",
    "tsconfig-paths": "^4.1.2",
    "typescript": "^5.3.3"
  },
  "engines": {
    "node": ">=20.11.0"
  }
}
