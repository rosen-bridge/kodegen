---
to: ./<%= servicePath %>/package.json
sh: cd <%= servicePath %> && npx --yes sort-package-json && npm i
---
{
  "name": "<%= h.inflection.dasherize(serviceName) %>",
  "version": "0.1.0",
  "description": "<%= description %>",
  "repository": "<%= repo %>",
  "main": "dist/index.js",
  "types": "dist/index.d.ts",
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
<% if (features.database) { -%>
    "typeorm": "NODE_OPTIONS=--experimental-specifier-resolution=node typeorm-ts-node-esm",
    "typeorm:generate": "npm run typeorm migration:generate ./src/db/migrations/migration -- -p -d ./src/data-source.ts",
    "typeorm:migrate": "npm run typeorm migration:run -- -d ./src/data-source.ts",
<% } -%>
    "start": "node --watch --experimental-specifier-resolution=node --loader ./ts-node-esm-loader.js ./src/index.ts",
    "start:prod": "node --experimental-specifier-resolution=node ./dist/index.js",
    "type-check": "tsc --noEmit"
  },
  "author": "<%= author %>",
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
<% if (features.prettierEslint) { -%>
    "@typescript-eslint/eslint-plugin": "^5.26.0",
    "@typescript-eslint/parser": "^5.26.0",
    "eslint": "^8.16.0",
    "eslint-config-prettier": "^8.5.0",
    "prettier": "2.7.1",
<% } -%>
<% if (features.testing) { -%>
    "@vitest/coverage-c8": "^0.26.3",
    "vitest": "^0.26.2",
<% } -%>
    "@types/node": "^18.11.18",
    "typescript": "^5.0.0",
<% if (features.express) { -%>
    "@types/express": "^4.17.13",
<% } -%>
    "@types/config": "^0.0.41",
    "tsconfig-paths": "^4.1.2",
    "ts-node": "^10.7.0"
  }
}
