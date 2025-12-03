# kodegen

## 0.8.0

### Minor Changes

- Add circular dependency checking with Madge
- add --help command to auto-list available generators and actions
- Add Knip config to detect unused and missing dependencies and replace it with depcheck
- Add default repository URL and update package template to use it in repository field
- Add clean script for build artifacts
- Windows compatibility for husky and NODE_OPTIONS
- Configure prettier with import sorting
- Centralize Vitest in monorepo root
- Centralize Vitest in monorepo root
  Update the `version` script to also create an empty changeset file

### Patch Changes

- Move shared devDependencies to monorepo root and update dependencies
- Fix Knip entry files configuration for monorepo packages

## 0.7.1

### Patch Changes

- fix bin command

## 0.7.0

### Minor Changes

- Improved eslint and updated some package versions
- Update node version to 22.18.0
- add depcheck to pipeline and precommit hooks
- Add MIT license file

### Patch Changes

- Make prettier and eslint fail on CI when formatting issues exist

## 0.6.0

### Minor Changes

- Update `@rosen-bridge/changeset-formatter` to v1

### Patch Changes

- Fix typo in issue templates
- Fix uploading file while publishing a package

## 0.5.0

### Minor Changes

- Replace tsx tools instead of extensionless
- add --version argument
- Update vitest version to v3.1.4

### Patch Changes

- Install `@rosen-bridge/extended-typeorm` package instead of official typeorm package!
- fix mirroring github action file path

## 0.4.0

### Minor Changes

- add "version" npm script if changesets is enabled

### Patch Changes

- in "monorepo add-package", run test before publish if testing is enabled
- change all initial versions to 0.0.0
- do not use watch mode for running tests before publish

## 0.3.0

### Minor Changes

- add changeset support

## 0.2.0

### Minor Changes

- switch to `@rosen-bridge/winston-logger` for logging purposes
- upgrade main dependencies in all of `package.json` files
- add new general purpose configs to base tsconfig of `monorepo init`

### Patch Changes

- fix wrong main script in repo init
- add tests directory only if testing feature is enabled
- switch to node `--loader` flag instead of `--experimental-specifier-resolution` flag
- add missing prepare npm script to repo init command
- remove redundant coverage reporters from vitest config
