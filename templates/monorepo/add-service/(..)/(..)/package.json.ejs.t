---
to: ./package.json
inject: true
after: packages
skip_if: <%= servicePath.replace(/\.\/(.+)\/.+/, '$1') %>
sh: npx --yes sort-package-json
---
      "<%= servicePath.replace(/\.\/(.+)\/.+/, '$1') %>/*",
