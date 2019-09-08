#!/usr/bin/env bash

set -o errexit
set -o nounset
set -x

cd /srv

if [[ ! -d content.git ]]; then
  git init --bare content.git
  pushd content.git
  git remote add origin https://github.com/linux-ag/website.git
  popd
fi

if [[ ! -d content ]]; then
  mkdir content
fi

export GIT_DIR=content.git
export GIT_WORK_TREE=content

git fetch
git reset --hard origin/master

# TODO: Listen for GitHub Webhook events (will have to wait until we change the
# CNAME record for www.linux-ag.uni-tuebingen.de from 134.2.2.45 to
# 134.2.220.61).
