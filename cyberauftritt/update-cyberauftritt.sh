#!/bin/bash

DOCKER_COMPOSE_PATH=/usr/local/bin

cd /srv/docker/cyberauftritt

# build the container before restarting (this will reduce downtime)
cd cyberauftritt-git
git pull origin master
cd ..
$DOCKER_COMPOSE_PATH/docker-compose build --quiet

# shut down the containers and remove them
$DOCKER_COMPOSE_PATH/docker-compose down

# pull new version of the code from github
cd cyberauftritt-git
rm -r _site
mkdir _site
chown 1000 -R _site

cd ..
$DOCKER_COMPOSE_PATH/docker-compose up -d --build --quiet

exit 0
