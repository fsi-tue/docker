#!/bin/bash

cd /srv/docker/homepage/

# build the container before restarting (this will reduce downtime)
cd cyberauftritt-git
git pull origin master
cd ..
docker-compose build

# shut down the containers and remove them
docker-compose down

# pull new version of the code from github
cd cyberauftritt-git
rm -r _site
mkdir _site
chown 1000 -R _site

cd ..
docker-compose up -d --build

exit 0
