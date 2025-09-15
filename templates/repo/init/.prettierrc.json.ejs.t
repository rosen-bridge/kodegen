---
to: "<%= (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) ? `./${projectName}/.prettierrc.json` : null %>"
---
{
  "singleQuote": true
}
