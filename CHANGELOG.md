# kodegen

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
