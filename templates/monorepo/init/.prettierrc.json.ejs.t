---
to: "<%= (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) ? `./${monorepoName}/.prettierrc.json` : null %>"
---
{
  "singleQuote": true
}
