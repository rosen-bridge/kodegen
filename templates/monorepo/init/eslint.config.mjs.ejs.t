---
to: "<%= (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) ? `./${monorepoName}/eslint.config.mjs` : null %>"
---
import pluginJs from '@eslint/js';
import typescriptEslint from '@typescript-eslint/eslint-plugin';
import typescriptParser from '@typescript-eslint/parser';
import pluginCheckFile from 'eslint-plugin-check-file';
<% if (features.testing) { -%>
import vitestPlugin from '@vitest/eslint-plugin';
<% } -%>
import prettier from 'eslint-config-prettier';
import globals from 'globals';
<% if (features.eslintFeaturesReact) { -%>
import reactHooks from 'eslint-plugin-react-hooks';
import reactRefresh from 'eslint-plugin-react-refresh';
<% } -%>

export default [
  {
    // General Ignore Patterns
    ignores: ['**/dist/*', '**/node_modules/*'],
  },
  pluginJs.configs.recommended,
  {
    files: [
      '{services,packages}/**/*.{js,jsx,ts,tsx}',
    ],
    languageOptions: {
      // Base Configuration for JS/TS Files
      parser: typescriptParser,
      ecmaVersion: 'latest',
      sourceType: 'module',
      globals: {
<% if (features.eslintFeaturesNode) { -%>
        // Node-Specific Globals
        ...globals.node,
<% } -%>
<% if (features.eslintFeaturesBrowser) { -%>
        // Browser-Specific Globals
        ...globals.browser,
<% } -%>
<% if (features.testing) { -%>
        ...vitestPlugin.environments.env.globals,
<% } -%>
      },
    },
    plugins: {
      '@typescript-eslint': typescriptEslint,
      'check-file': pluginCheckFile,
<% if (features.testing) { -%>
      'vitest': vitestPlugin,
<% } -%>
<% if (features.eslintFeaturesReact) { -%>
      // React-Specific Plugins
      'react-refresh': reactRefresh,
      'react-hooks': reactHooks,
<% } -%>
    },
    rules: {
   'check-file/filename-naming-convention': [
      'error',
       { '**/*.{js,ts,jsx,tsx}': 'CAMEL_CASE' },
      { ignoreMiddleExtensions: true },
     ],
<% if (features.eslintFeaturesReact) { -%>
      // React-Specific Rules
      'react-refresh/only-export-components': 'warn',
<% } -%>
<% if (features.testing) { -%>
      // vitest Rules
      ...vitestPlugin.configs.recommended.rules
<% } -%>
    }
  },
  // Integrate Prettier for Formatting
  prettier,
];
