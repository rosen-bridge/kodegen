---
to: tsconfig.json
---
{
  "compilerOptions": {
    "baseUrl": ".",
<% if (features.database) { -%>
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
<% } -%>
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,
    "inlineSourceMap": true,
    "module": "esnext",
    "moduleResolution": "node",
    "noFallthroughCasesInSwitch": true,
    "outDir": "dist",
    "paths": {
      "@/configs": ["./src/configs"],
      "@/configs/*": ["./src/configs/*"],
<% if (features.database) { -%>
      "@/entities": ["./src/db/entities"],
<% } -%>
      "@/types": ["./src/types"],
      "@/utils/*": ["./src/utils/*"]
    },
    "resolveJsonModule": true,
    "skipLibCheck": true,
    "strict": true,
    "target": "esnext"
  },
  "include": ["./**/*.ts"],
  "ts-node": {
    "esm": true
  }
}
