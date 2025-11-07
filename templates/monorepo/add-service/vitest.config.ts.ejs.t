---
to: "<%= features.testing ? `./${servicePath}/vitest.config.ts` : null %>"
---
import { defineProject, mergeConfig } from 'vitest/config';
<% 
  normalizedServicePath = servicePath.replace('./', '')
  depth = normalizedServicePath.split('/').length
  sharedConfigPath = '../'.repeat(depth) + 'vitest.shared'
%>
import configShared from '<%= sharedConfigPath %>';

export default mergeConfig(
  configShared,
  defineProject({
  <% if (features.logging) { -%>
    test: {
      setupFiles: ['./tests/setup.ts'],
    }
  <% } -%>
  })
);
