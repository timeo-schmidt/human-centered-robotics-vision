#!/bin/bash
set -e
source .env

echo "Building '${TAG}'"

docker build --build-arg ZED_SDK_MAJOR=${ZED_SDK_MAJOR} \
--build-arg ZED_SDK_MINOR=${ZED_SDK_MINOR} \
--build-arg L4T_MAJOR_VERSION=${L4T_MAJOR_VERSION} \
--build-arg L4T_MINOR_VERSION=${L4T_MINOR_VERSION} \
--build-arg ROS_DISTRO_ARG=${ROS_DISTRO_ARG} \
-t "${TAG}" -f "${DOCKERFILE_PATH}" .