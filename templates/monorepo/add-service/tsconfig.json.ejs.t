---
to: ./<%= servicePath %>/tsconfig.json
---
<%
    normalizedServicePath = servicePath.replace('./', '')
    depth = normalizedServicePath.split('/').length
    extendsPath = '../'.repeat(depth) + 'tsconfig.base.json'
%>
{
  "extends": "<%= extendsPath %>",
  "compilerOptions": {
    "outDir": "./dist",
    "baseUrl": ".",
<% if (features.database) { -%>
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
<% } -%>
<% if (testing) { -%>
    "types": ["node", "vitest/globals"],
<% } else { -%>
    "types": ["node"],
<% } -%>
  },
  "include": ["src"]
}
