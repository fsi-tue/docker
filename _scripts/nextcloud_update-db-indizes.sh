#!/bin/bash

# Author: Lukas Oertel <git@luoe.dev>
#
# Script to update indizes in all Nextcloud databases

DOCKER_BINARY=/usr/bin/docker
DIR=/srv/docker
YML=docker-compose.yml

$DOCKER_BINARY compose -f $DIR/nextcloud/$YML exec -u www-data app ./occ db:add-missing-indices
$DOCKER_BINARY compose -f $DIR/kogni-nextcloud/$YML exec -u www-data app ./occ db:add-missing-indices
