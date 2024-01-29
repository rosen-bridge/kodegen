---
to: "<%= features.testing ? `./${servicePath}/vitest.config.ts` : null %>"
---
import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    coverage: {
      all: true,
      provider: 'istanbul',
      reporter: 'cobertura',
    },
    passWithNoTests: true,
    poolOptions: {
      threads: {
        singleThread: true,
      },
    },
  },
});
