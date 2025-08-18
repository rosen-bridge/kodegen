---
to: "<%= features.prettierEslint ? `./${monorepoName}/.eslintrc.json` : null %>"
---
{
  {
  "root": true,
  "env": {
    "node": true
  },
  "parser": "@typescript-eslint/parser",
  "plugins": [
    "@typescript-eslint",
    "check-file"
  ],
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "prettier"
  ],
  "rules": {
    "@typescript-eslint/no-unused-vars": "error",
    "@typescript-eslint/no-explicit-any": "error",
    "check-file/filename-naming-convention": [
      "error",
      {
        "**/*.{js,ts}": "CAMEL_CASE"
      },
      {
        "ignoreMiddleExtensions": true
      }
    ]
  },
  "ignorePatterns": [
    "**/node_modules/**",
    "**/dist/**",
    "**/build/**"
  ]
}

}
