---
to: ./<%= packagePath %>/tsconfig.json
---
{
  "extends": "../../tsconfig.base.json",
  "compilerOptions": {
    "outDir": "./dist"
  },
  "include": ["tests", "lib"]
}
