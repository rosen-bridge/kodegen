---
to: ./<%= servicePath %>/tsconfig.json
---
{
  "extends": "../../tsconfig.base.json",
  "compilerOptions": {
    "outDir": "./dist",
    "baseUrl": ".",
<% if (features.database) { -%>
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
<% } -%>
  },
  "include": ["src"],
  "ts-node": {
    "esm": true
  }
}
