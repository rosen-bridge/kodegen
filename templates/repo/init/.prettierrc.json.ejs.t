---
to: "<%= (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) ? `./${projectName}/.prettierrc.json` : null %>"
---
{
  "singleQuote": true,
  "importOrder": [
    "<THIRD_PARTY_MODULES>",
    "^@/(.*)$",
    "^[.](.*)$"
  ],
  "importOrderCaseInsensitive": true,
  "importOrderParserPlugins": ["typescript"],
  "importOrderSeparation": true,
  "importOrderSortSpecifiers": false,
  "plugins": ["@trivago/prettier-plugin-sort-imports"]
}
