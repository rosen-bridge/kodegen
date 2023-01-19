---
to: ./<%= projectName %>/src/index.ts
---
<% if (features.database) { -%>
import './bootstrap';
<% } -%>

<% if (features.express) { -%>
import startApp from './app';
<% } -%>

<% if (features.database) { -%>
import { dataSource } from './data-source';
<% } -%>

const main = async () => {
<% if (features.database) { -%>
    await dataSource.initialize();
    await dataSource.runMigrations();
<% } -%>
<% if (features.express) { -%>
    startApp();
<% } -%>
}

main().then(() => null)
