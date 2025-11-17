---
to: "<%= testing ? `./${packagePath}/vitest.config.ts` : null %>"
---
import { defineProject, mergeConfig } from 'vitest/config';
<% 
  normalizedPackagePath = packagePath.replace('./', '')
  depth = normalizedPackagePath.split('/').length
  sharedConfigPath = '../'.repeat(depth) + 'vitest.shared'
%>
// @ts-expect-error – allow importing shared config
import configShared from '<%= sharedConfigPath %>';

export default mergeConfig(
  configShared,
  defineProject({})
);
