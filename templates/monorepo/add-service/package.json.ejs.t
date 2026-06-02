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
  <% if (hasCiPublishWorkflow) { %>"private": true,<% } %>
  "description": "<%= description %>",
  "repository": {
    "type": "git",
    "url": "<%= repo %>"
  },
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
    "test": "cross-env NODE_OPTIONS=\"--import tsx\" vitest",
    "coverage": "npm run test -- --coverage",
<% } -%>
<% if (features.database) { -%>
    "typeorm": "cross-env NODE_OPTIONS=\"--import tsx\" extended-typeorm",
    "typeorm:generate": "npm run typeorm migration:generate ./src/db/migrations/migration -- -p -d ./src/dataSource.ts",
    "typeorm:migrate": "npm run typeorm migration:run -- -d ./src/dataSource.ts",
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
    "@rosen-bridge/abstract-logger": "^4.0.0",
    "@rosen-bridge/winston-logger": "^3.0.1",
<% } -%>
<% if (features.database) { -%>
    "reflect-metadata": "^0.1.13",
    "sqlite3": "^5.0.8",
    "@rosen-bridge/extended-typeorm": "^1.1.0",
<% } -%>
    "config": "^3.3.7"
  },
  "devDependencies": {
<% if (features.express) { -%>
    "@types/express": "^4.17.13",
<% } -%>
    "@types/config": "^0.0.41"
  },
  "engines": {
    "node": ">=22.18.0",
    "npm": "11.6.2"
  }
}
