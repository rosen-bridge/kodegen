---
to: "<%= features.database ? `./${servicePath}/src/bootstrap.ts` : null %>"
---
<% if (features.database) { -%>
import 'reflect-metadata';
<% } -%>
