#!/bin/bash

source .env

xhost +

docker run -it --env=${DISPLAY} \
    --env=${QT_X11_NO_MITSHM=1} \
    --volume=${VOLUME} \
    --runtime nvidia \
    --gpus all \
    --priviliged ${TAG} \
    bash