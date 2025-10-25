---
to: "<%= features.knip ? `./${monorepoName}/knip.json` : null %>"
---
{
  "$schema": "https://unpkg.com/knip/schema.json",
  "ignoreDependencies": [
    "rimraf"
  ]
}
