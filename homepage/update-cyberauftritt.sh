#!/bin/bash

cd /srv/docker/homepage/

# shut down the containers and remove them
docker-compose down

# pull new version of the code from github
cd cyberauftritt-git
rm -r _site
git pull origin master
mkdir _site
chown 1000 -R _site

cd ..
docker-compose up -d

exit 0
