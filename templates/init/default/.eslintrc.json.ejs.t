---
to: "<%= features.prettierEslint ? '.eslintrc.json' : null %>"
---
{
  "root": true,
  "env": {
    "node": true
  },
  "parser": "@typescript-eslint/parser",
  "plugins": ["@typescript-eslint"],
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "prettier"
  ]
}
