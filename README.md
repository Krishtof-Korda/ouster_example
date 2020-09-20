[![Docker Stars](https://img.shields.io/docker/stars/kbearrk/ouster_example_cartographer.svg)](https://hub.docker.com/r/kbearrk/ouster_example_cartographer/)
[![Docker Pulls](https://img.shields.io/docker/pulls/kbearrk/ouster_example_cartographer.svg)](https://hub.docker.com/r/kbearrk/ouster_example_cartographer/)
[![GitHub](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/Krishtof-Korda/ouster_example_cartographer/blob/master/LICENSE)


Sample code for doing SLAM with an Ouster sensor. Also includes example code for connecting to and configuring the Ouster sensor, reading and visualizing
data, and interfacing with ROS.

See the `README.md` in each subdirectory for details.

## Contents
* [ouster_client/](ouster_client/README.md) contains an example C++ client for the Ouster sensor
* [ouster_viz/](ouster_viz/README.md) contains a visualizer for the Ouster sensor
* [ouster_ros/](ouster_ros/README.md) contains example ROS nodes for publishing point cloud messages
* [cartographer_ros/](cartographer_ros/) contains example Cartographer ROS configuration files for doing SLAM with an Ouster sensor

## Sample Data
* Sample sensor output usable with the provided ROS code is available
  [here](https://data.ouster.io/sample-data-1.13)
