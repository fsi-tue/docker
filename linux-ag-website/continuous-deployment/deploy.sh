#!/usr/bin/env bash

set -o errexit
set -o nounset
set -x

cd /srv

for repository in website presentation; do

  if [[ ! -d $repository.git ]]; then
    git init --bare $repository.git
    pushd $repository.git
    git remote add origin https://github.com/linux-ag/$repository.git
    popd
  fi

  export GIT_DIR=$repository.git
  export GIT_WORK_TREE=$repository

  if [[ ! -d $repository ]]; then
    mkdir $repository
  fi

  git fetch
  git reset --hard origin/master

  unset GIT_DIR
  unset GIT_WORK_TREE

done

# TODO: Listen for GitHub Webhook events (will have to wait until we change the
# CNAME record for www.linux-ag.uni-tuebingen.de from 134.2.2.45 to
# 134.2.220.61).
