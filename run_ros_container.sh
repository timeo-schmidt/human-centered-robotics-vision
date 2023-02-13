#!/bin/bash

source .env

xhost +

docker run \
    --privileged \
    --gpus all \
    --entrypoint bash \
    --runtime nvidia \
    -it \
    --net=host \
    -e DISPLAY=$DISPLAY \
    --ipc=host \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /tmp/argus_socket:/tmp/argus_socket \
    ${TAG}