---
to: "<%= features.changesets ? `./${monorepoName}/.changeset/config.json` : null %>"
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
  },
   "___experimentalUnsafeOptions_WILL_CHANGE_IN_PATCH": {
    "updateInternalDependents": "always"
  }<% if (features.ciCdGithubActionsSnapshot || features.ciCdGitlabSnapshot) { %>,
  "snapshot": {
    "useCalculatedVersion": true,
    "prereleaseTemplate": "{tag}"
  }<% } %>
}
