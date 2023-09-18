---
to: ./<%= projectName %>/package.json
sh: cd <%= projectName %> && npx --yes sort-package-json && npm i
---
{
  "name": "<%= h.inflection.dasherize(projectName) %>",
  "version": "0.0.1",
  "description": "<%= description %>",
  "repository": "<%= repo %>",
  "main": "dist/src/index.js",
  "type": "module",
  "scripts": {
<% if (features.prettierEslint) { -%>
    "prettify": "prettier --write . --ignore-path ./.gitignore",
    "lint": "eslint --fix . && npm run prettify",
<% } -%>
<% if (features.testing) { -%>
    "test": "vitest",
    "coverage": "vitest run --coverage",
<% } -%>
    "start": "node --watch --experimental-specifier-resolution=node --loader ./ts-node-esm-loader.js ./src/index.ts",
    "start:prod": "node --experimental-specifier-resolution=node ./dist/src/index.js",
    "build": "rimraf dist && tsc",
<% if (features.database) { -%>
    "typeorm": "NODE_OPTIONS=--experimental-specifier-resolution=node typeorm-ts-node-esm",
    "typeorm:generate": "npm run typeorm migration:generate ./src/db/migrations/migration -- -p -d ./src/data-source.ts",
    "typeorm:migrate": "npm run typeorm migration:run -- -d ./src/data-source.ts",
<% } -%>
    "type-check": "tsc --noEmit"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
<% if (features.express) { -%>
    "express": "^4.18.1",
<% } -%>
<% if (features.logging) { -%>
    "winston": "^3.8.2",
    "winston-daily-rotate-file": "^4.7.1",
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
    "@typescript-eslint/eslint-plugin": "^6.7.0",
    "@typescript-eslint/parser": "^6.7.0",
    "eslint": "^8.16.0",
    "eslint-config-prettier": "^8.5.0",
    "prettier": "2.7.1",
<% } -%>
<% if (features.testing) { -%>
    "@vitest/coverage-c8": "^0.26.3",
    "vitest": "^0.26.2",
<% } -%>
    "@types/config": "^0.0.41",
    "husky": "^8.0.0",
    "lint-staged": "^13.0.3",
    "ts-node": "^10.7.0",
    "@types/node": "^18.11.18",
    "tsconfig-paths": "^4.1.2"
  },
  "engines": {
    "node": ">=18.12.0"
  }
}
