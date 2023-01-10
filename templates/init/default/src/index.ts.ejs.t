---
to: './src/index.ts'
---
<% if (features.database) { -%>
import './bootstrap';

<% } -%>
<% if (features.express) { -%>
import startApp from './app';

startApp();
<% } -%>
