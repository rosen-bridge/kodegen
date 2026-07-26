---
to: ./<%= monorepoName %>/.github/workflows/mirroring.yml
---
name: Mirroring

on:
  push:
    branches:
      - master
      - dev
      - 'snapshot-*-release'
    tags:
      - '*'

jobs:
  git-sync:
    uses: rosen-bridge/operation/.github/workflows/mirroring-reusable.yml@master
    secrets: inherit
