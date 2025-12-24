---
to: "<%= features.ciCdGitlabCi ? `./${monorepoName}/.gitlab/workflows/ci.yml` : null %>"
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
<% } -%>
<% if (features.knip) { -%>
      enable_knip: true
<% } -%>
<% if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>
      enable_lint: true
<% } -%>
<% if (features.testing) { -%>
      enable_test: true
<% } -%>
<% if (features.changesets) { -%>
      enable_changeset: true
<% } -%>