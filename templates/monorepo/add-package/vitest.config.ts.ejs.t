---
to: "<%= features.testing ? `./${packagePath}/vitest.config.ts` : null %>"
---
import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    coverage: {
      all: true,
      reporter: ['cobertura', 'text', 'text-summary'],
    },
    passWithNoTests: true,
  },
});
