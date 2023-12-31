---
to: ./<%= monorepoName %>/tsconfig.base.json
---
{
  "compilerOptions": {
    "allowJs": false,
    "esModuleInterop": true,
    "inlineSourceMap": true,
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
