---
to: "<%= features.ciCdGitlabCi ? `./${monorepoName}/.gitlab/workflows/ci.yml` : null %>"
---
image: node:22.18.0

default:
  interruptible: true

workflow:
  auto_cancel:
    on_job_failure: all

stages:
  - ci

variables:
  npm_config_cache: '${CI_PROJECT_DIR}/.npm'
  NPM_VERSION: '11.6.2'

before_script:
  - npm i -g npm@${NPM_VERSION}
<% if (features.knip) { -%>

knip:
  stage: knip
  cache:
    key: ${CI_COMMIT_REF_NAME}
    policy: pull
    paths:
      - node_modules
      - .npm
  script:
    - npx knip --dependencies
<% } -%>

type-check:
  stage: type-check
  cache:
    key: ${CI_COMMIT_REF_NAME}
    policy: pull
    paths:
      - node_modules
      - '**/node_modules'
      - '**/dist'
      - .npm
  script:
    - npm run type-check 
<% if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>

lint:
  stage: lint
  cache:
    key: ${CI_COMMIT_REF_NAME}
    policy: pull
    paths:
      - node_modules
      - .npm
  script:
    - npm run lint:check
<% } -%>
<% if (features.testing) { -%>

test:
  stage: test
  cache:
    key: ${CI_COMMIT_REF_NAME}
    policy: pull
    paths:
      - node_modules
      - '**/node_modules'
      - '**/dist'
      - .npm
  script:
    - npm run coverage
  coverage: '/All files[^|]*\|[^|]*\s+([\d\.]+)/'
  artifacts:
    reports:
      coverage_report:
        coverage_format: cobertura
        path: '**/coverage/cobertura-coverage.xml'
<% } -%>
<% if (features.changesets) { -%>

changeset:
  stage: changeset
  cache:
    key: ${CI_COMMIT_REF_NAME}
    policy: pull
    paths:
      - node_modules
      - '**/node_modules'
      - '**/dist'
      - .npm
  before_script:
    - git fetch origin dev
    - npm i -g npm@${NPM_VERSION}
  script:
    - npx changeset status --since=origin/dev
<% } -%>