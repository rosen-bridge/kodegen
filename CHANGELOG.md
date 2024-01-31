# kodegen

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
