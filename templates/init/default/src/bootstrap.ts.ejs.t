---
to: "<%= features.database ? './src/bootstrap.ts' : null %>"
---
<% if (features.database) { -%>
import 'reflect-metadata';
<% } -%>
