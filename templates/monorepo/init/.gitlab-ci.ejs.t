---
to: "<%= features.ciCd ? `./${monorepoName}/.gitlab-ci.yml` : null %>"
---
image: node:22.18.0

stages:
  - installation
<% if (features.depcheck) { -%>
  - depcheck
<% } -%>
  - build
  - type-check
<% if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>
  - lint
<% } -%>
<% if (features.testing) { -%>
  - test
<% } -%>
<% if (features.changesets) { -%>
  - changeset
<% } -%>

installation:
  stage: installation
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: push
    paths:
      - node_modules
      - '**/node_modules'
  script:
    - npm ci

<% if (features.depcheck) { -%>
depcheck:
  stage: depcheck
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
      - '**/node_modules'
  script:
    - git fetch origin $CI_DEFAULT_BRANCH
    - npx lint-staged --diff origin/$CI_DEFAULT_BRANCH...HEAD
<% } -%>

type-check:
  stage: type-check
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
      - '**/node_modules'
      - '**/dist'
  script:
    - npm run type-check

build:
  stage: build
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull-push
    paths:
      - node_modules
      - '**/node_modules'
      - '**/dist'
  script:
    - npm run build
<% if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>

lint:
  stage: lint
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
      - '**/node_modules'
      - '**/dist'
  script:
    - npm run lint:check
<% } -%>
<% if (features.testing) { -%>

test:
  stage: test
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
      - '**/node_modules'
      - '**/dist'
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
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
      - '**/node_modules'
      - '**/dist'
  before_script:
    - git fetch origin dev
  script:
    - npx changeset status --since=origin/dev
<% } -%>
