#!/bin/bash
set -e

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash" 
# source "$ROS_WS/devel/setup.bash"

# setup catkin workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make

# Install zed sdk
cd ~/catkin_ws/src
git clone --recursive https://github.com/stereolabs/zed-ros-wrapper.git
cd ../

sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src -r -y

catkin_make -DCMAKE_BUILD_TYPE=Release

chmod a+x devel/setup.bash
source ./devel/setup.bash

exec "$@" # pass all arguments to the entrypoint

# docker run --runtime nvidia --gpus all -it --privileged <DOCKER IMAGE>