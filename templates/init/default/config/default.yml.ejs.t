---
to: ./<%= projectName %>/config/default.yml
---
<% if (features.express) { -%>
apiPort: 8000
<% } -%>
<% if (features.logging) { -%>
logs:
  maxSize: 20m
  maxFilesCount: 14d
  path: ./logs/
  level: info
<% } -%>
