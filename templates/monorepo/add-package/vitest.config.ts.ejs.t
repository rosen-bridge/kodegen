---
to: "<%= features.testing ? `./${packagePath}/vitest.config.ts` : null %>"
---
import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    globals: true,
    coverage: {
      all: true,
      provider: 'istanbul',
      reporter: 'cobertura',
    },
    passWithNoTests: true,
    poolOptions: {
      forks: {
        singleFork: true,
      },
    },
  },
});
