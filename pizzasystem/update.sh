#!/bin/bash

# Author: Lukas Oertel <git@luoe.dev>
#
# Script that is triggered by Github Actions that does the following things:
# - Pulls the new code
# - Builds the NodeJS app
# - Force recreates the containers that new images are definitely used

PIZZA_DATA=/srv/data/pizzasystem
PIZZA_DOCKER=/srv/docker/pizzasystem

/bin/chown 1001:1001 -R $PIZZA_DATA
sudo -u #1001 /usr/bin/git -C $PIZZA_DATA pull origin main
/usr/bin/docker compose -f $PIZZA_DOCKER/docker-compose.yml build --no-cache
/usr/bin/docker compose -f $PIZZA_DOCKER/docker-compose.yml up -d --force-recreate
# /bin/chown 1001:1001 -R $PIZZA_DATA

