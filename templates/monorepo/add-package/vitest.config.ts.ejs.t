---
to: "<%= testing ? `./${packagePath}/vitest.config.ts` : null %>"
---
import { defineProject, mergeConfig } from 'vitest/config';
<% 
  normalizedPackagePath = packagePath.replace('./', '')
  depth = normalizedPackagePath.split('/').length
  sharedConfigPath = '../'.repeat(depth) + 'vitest.shared'
%>
import configShared from '<%= sharedConfigPath %>';

export default mergeConfig(
  configShared,
  defineProject({})
);
