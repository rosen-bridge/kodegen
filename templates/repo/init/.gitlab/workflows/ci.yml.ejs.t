---
to: "<%= features.ciCdGitlabCi ? `./${projectName}/.gitlab/workflows/ci.yml` : null %>"
---
image: $GITLAB_CI_IMAGE

default:
  interruptible: true

workflow:
  auto_cancel:
    on_job_failure: all

include:
  - component: $CI_SERVER_FQDN/${CI_COMPONENT}
<%
  const hasInputs = [
    features.knip,
    features.eslintFeaturesNode,
    features.eslintFeaturesBrowser,
    features.eslintFeaturesReact,
    features.testing,
    features.changesets,
  ].some(Boolean);
-%>

<% if (hasInputs) { -%>
    inputs:
      type_check_cache_paths:
        - node_modules
<% } -%>
<% if (features.knip) { -%>
      enable_knip: true
<% } -%>
<% if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>
      enable_lint: true
<% } -%>
<% if (features.testing) { -%>
      enable_test: true
      test_cache_paths:
        - node_modules
<% } -%>
<% if (features.changesets) { -%>
      enable_changeset: true
<% } -%>
