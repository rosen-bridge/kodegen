---
to: "<%= features.knip ? `./${projectName}/knip.json` : null %>"
---
{
  "$schema": "https://unpkg.com/knip/schema.json",
  <% if (features.database) { -%>
      "ignoreBinaries": ["typeorm"]
  <% } -%>
}
