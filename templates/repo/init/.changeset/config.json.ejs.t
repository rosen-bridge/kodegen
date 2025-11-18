---
to: "<%= features.changesets ? `./${projectName}/.changeset/config.json` : null %>"
---
{
  "$schema": "https://unpkg.com/@changesets/config@3.0.0/schema.json",
  "changelog": "@rosen-bridge/changeset-formatter",
  "commit": false,
  "fixed": [],
  "linked": [],
  "access": "public",
  "baseBranch": "dev",
  "updateInternalDependencies": "patch",
  "ignore": [],
  "privatePackages": {
    "version": true
  }<% if (features.ciCdGithubActionsSnapshot || features.ciCdGitlabSnapshot) { %>,
  "snapshot": {
    "useCalculatedVersion": true,
    "prereleaseTemplate": "{tag}"
  }<% } %>
}
