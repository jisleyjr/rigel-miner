#!/usr/bin/env bash
set -euo pipefail
set -x
VER="1.22.2"
if [ ! $# -ne 1 ]; then
  echo "Using supplied version $1"
  $VER=$1
fi

DOCKER_project_namespace='jisleyjr'
DOCKER_app_name='rigel-miner'

DOCKER_image_tag_ver=$DOCKER_project_namespace/$DOCKER_app_name:$VER
DOCKER_image_tag_latest=$DOCKER_project_namespace/$DOCKER_app_name

docker build --build-arg "VER=$VER" -t "$DOCKER_image_tag_latest" -t "$DOCKER_image_tag_ver" .
#docker push $DOCKER_image_tag_latest
#docker push $DOCKER_image_tag_ver
printf "$DOCKER_image_tag_ver\n" > .manifest