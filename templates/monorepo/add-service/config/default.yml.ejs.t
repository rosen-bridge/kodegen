---
to: ./<%= servicePath %>/config/default.yml
---
<% if (features.express) { -%>
api:
  port: 8800
  host: 127.0.0.1
<% } -%>
<% if (features.logging) { -%>
logs:
  maxSize: 20m
  maxFilesCount: 14d
  path: ./logs/
  level: info
<% } -%>
