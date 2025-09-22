---
to: ./<%= servicePath %>/package.json
sh: cd <%= servicePath %> && npx --yes sort-package-json && npm i
---
<%
    const normalizedServicePath = servicePath.replace('./', '');
    const depth = normalizedServicePath.split('/').length;
    relativeIgnorePath = '../'.repeat(depth) + '.gitignore';
%>
{
  "name": "<%= h.inflection.dasherize(serviceName) %>",
  "version": "0.0.0",
  "description": "<%= description %>",
  "repository": "<%= repo %>",
  "main": "src/index.ts",
  "type": "module",
  "files": [
    "dist",
    "CHANGELOG.md"
  ],
  "scripts": {
<% if (h.rootHasEslint) { -%>
    "prettify": "prettier --write .<% if (relativeIgnorePath) { %> --ignore-path <%= relativeIgnorePath %><% } %>",
    "prettify:check": "prettier --check .<% if (relativeIgnorePath) { %> --ignore-path <%= relativeIgnorePath %><% } %>",
    "lint": "eslint --fix . && npm run prettify",
    "lint:check": "eslint . && npm run prettify:check",
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
  "license": "MIT",
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
