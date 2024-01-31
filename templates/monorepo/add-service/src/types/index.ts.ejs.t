---
to: ./<%= servicePath %>/src/types/index.ts
---
<% if (features.express) { -%>
export * from './router';
<% } -%>
