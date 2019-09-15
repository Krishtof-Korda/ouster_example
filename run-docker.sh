#!/bin/bash

xhost +local:root
IMG=wilselby/ouster_example:latest

# If NVIDIA is present, use Nvidia-docker
if test -c /dev/nvidia0
then
    docker run --rm -it \
      --runtime=nvidia \
      --privileged \
      --device /dev/dri:/dev/dri \
      --env="DISPLAY" \
      --env="QT_X11_NO_MITSHM=1" \
      -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
      $IMG \
      bash
else
    docker run --rm -it \
      -e DISPLAY \
      --device=/dev/dri:/dev/dri \
      -v "/tmp/.X11-unix:/tmp/.X11-unix" \
      $IMG \
      bash
fi

# Google Cartographer commands

# Run all commands from the /root/bags directory
# cd /root/bags

# Get sample data
# cd /root/bags
# curl -O https://selbystorage.s3-us-west-2.amazonaws.com/Files/office_demo.bag

# Source the workspace
# source /root/catkin_ws/devel/setup.bash

## Validate rosbag
#rosrun cartographer_ros cartographer_rosbag_validate -bag_filename /root/bags/office_demo.bag

## Run 2D online
#roslaunch cartographer_ros demo_cart_2d.launch bag_filename:=/root/bags/office_demo.bag

## Run 2D offline (to generate .pbstream file)
#roslaunch cartographer_ros offline_cart_2d.launch bag_filenames:=/root/bags/office_demo.bag

## Run 2D assets_writer
#roslaunch cartographer_ros assets_writer_cart_2d.launch bag_filenames:=/root/bags/office_demo.bag  pose_graph_filename:=/root/bags/office_demo.bag.pbstream 

## View output pngs
#xdg-open office_demo.bag_xray_xy_all.png
#xdg-open office_demo.bag_probability_grid.png

## Run 3d online
#roslaunch cartographer_ros demo_cart_3d.launch bag_filename:=/root/bags/office_demo.bag

## Run 3d offline
#roslaunch cartographer_ros offline_cart_3d.launch bag_filenames:=/root/bags/office_demo.bag 

## Run 3d assets_writer
#roslaunch cartographer_ros assets_writer_cart_3d.launch bag_filenames:=/root/bags/office_demo.bag  pose_graph_filename:=/root/bags/office_demo.bag.pbstream 

#xdg-open office_demo.bag_xray_xy_all.png
#xdg-open office_demo.bag_probability_grid.png

