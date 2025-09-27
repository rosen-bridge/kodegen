---
to: ./<%= monorepoName %>/tsconfig.base.json
---
{
  "compilerOptions": {
    "allowJs": false,
    "declaration": true,
    "declarationMap": true,
    "esModuleInterop": true,
    "incremental": false,
    "inlineSourceMap": true,
    "inlineSources": true,
    "isolatedModules": false,
    "module": "esnext",
    "moduleResolution": "node",
    "noFallthroughCasesInSwitch": true,
    "resolveJsonModule": true,
    "skipLibCheck": true,
    "strict": true,
    "target": "esnext"
  }
}
