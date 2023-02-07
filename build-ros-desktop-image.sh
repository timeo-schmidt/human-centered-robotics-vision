#!/bin/bash
set -e

# Specify versions
ZED_SDK_MAJOR=1
ZED_SDK_MINOR=1
L4T_MAJOR_VERSION=1
L4T_MINOR_VERSION=1
ROS_DISTRO_ARG="noetic"
DOCKERFILE_PATH="Dockerfile.ros"

# Create tag name based on the previously selected versions
TAG="jetson-ros-desktop:${ROS_DISTRO_ARG}-l4t-${L4T_MAJOR_VERSION}.${L4T_MINOR_VERSION}-zed-${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}"
echo "Building '${TAG}'"

docker build --build-arg ZED_SDK_MAJOR=${ZED_SDK_MAJOR} \
--build-arg ZED_SDK_MINOR=${ZED_SDK_MINOR} \
--build-arg L4T_MAJOR_VERSION=${L4T_MAJOR_VERSION} \
--build-arg L4T_MINOR_VERSION=${L4T_MINOR_VERSION} \
--build-arg ROS_DISTRO_ARG=${ROS_DISTRO_ARG} \
-t "${TAG}" -f "${DOCKERFILE}" .