---
to: "<%= features.ciCd ? `./${projectName}/.gitlab-ci.yml` : null %>"
---
image: node:18.12

stages:
  - installation
  - type-check
<% if (features.prettierEslint) { -%>
  - lint
<% } -%>
<% if (features.testing) { -%>
  - test
<% } -%>
<% if (features.semanticRelease) { -%>
  - publish
<% } -%>

installation:
  stage: installation
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: push
    paths:
      - node_modules
  script:
    - npm ci

type-check:
  stage: type-check
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
  script:
    - npm run type-check
<% if (features.prettierEslint) { -%>

lint:
  stage: lint
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
  script:
    - npm run lint
<% } -%>
<% if (features.testing) { -%>

test:
  stage: test
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
  script:
    - npm run coverage
  coverage: '/All files[^|]*\|[^|]*\s+([\d\.]+)/'
  artifacts:
    reports:
      coverage_report:
        coverage_format: cobertura
        path: coverage/cobertura-coverage.xml
<% } -%>
<% if (features.semanticRelease) { -%>

publish:
  stage: publish
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
  script:
    - npx semantic-release
<% } -%>
