---
to: ./<%= monorepoName %>/.github/mirroring.yml
---
name: Mirroring

on:
  push:
    branches:
      - master
      - dev
    tags:
      - '*'

jobs:
  git-sync:
    runs-on: ubuntu-latest
    steps:
      - name: git-sync
        uses: wei/git-sync@v3
        with:
          source_repo: ${GITHUB_REPOSITORY}
          source_branch: ${{github.ref_name}}
          destination_repo: 'https://${{ secrets.DESTINATION_USER }}:${{ secrets.DESTINATION_TOKEN }}@${{ secrets.DESTINATION_SERVER }}/ergo/${GITHUB_REPOSITORY}.git'
          destination_branch: ${{github.ref_name}}
