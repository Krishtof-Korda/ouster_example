#!/bin/bash
set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# get UBUNTU_CODENAME, ROS_DISTRO, REPO_DIR, CATKIN_DIR
source $SCRIPT_DIR/identify_environment.bash

if [ ! -d "$HOME/catkin_ws/src/ouster_example_cartographer" ]; then
    echo "ouster_example_cartographer repository not detected"
    cd "$HOME/catkin_ws/src"
    git clone https://github.com/Krishtof-Korda/ouster_example_cartographer.git
#    cd "$HOME/catkin_ws"
#    catkin build --no-status
#    echo "Package built successfully"
else
    echo "ouster_example_cartographer already installed"
fi

# Set cmake prefix path
export CMAKE_PREFIX_PATH=$HOME/catkin_ws/src/ouster_example_cartographer/

# Building the Sample Client
echo "building the sample client"
cd $HOME/catkin_ws/src/ouster_example_cartographer/ouster_client
mkdir build
cd build
cmake ..
make
echo "sample client built successfully"

# Building the Visualizer
echo "building the visualizer"
cd $HOME/catkin_ws/src/ouster_example_cartographer/ouster_viz
mkdir build
cd build
cmake ..
make
echo "visualizer built successfully"

#Building the Sample ROS Node
echo "building the sample ROS node"
source /opt/ros/melodic/setup.bash
cd $HOME/catkin_ws
catkin_make -DCMAKE_BUILD_TYPE=Release
echo "built the sample ROS node"

# Source the workspace
source $HOME/catkin_ws/devel/setup.bash

# get example data
#echo "downloading example data"
#cd ~
#mkdir bags
#cd bags
#wget -nv https://data.ouster.io/sample-data-2018-08-29/2018-08-29-16-46-17_0.bag
#echo "download complete"

