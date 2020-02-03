# Installation of franka ROS package with libfranka using Xstow

This description explains how to install the library libfranka and the Franka ROS package using Xstow.
This makes it unnecessary to give the library path when running catkin_make on the workspace.

```bash
sudo apt install build-essential cmake git libpoco-dev libeigen3-dev

cd ~/local/src # assuming your Xstow directory is in that folder
git clone --recursive https://github.com/frankaemika/libfranka

cd ~/local/DIR/
mkdir libfranka
cd libfranka/
cmake -DCMAKE_BUILD_TYPE=Release ../../src/libfranka/
cmake --build .
cd ..
xstow libfranka/


mkdir ~/franka_ws/src/ # or go to your workspace
catkin_make
cd ~/franka_ws/src/
git clone --recursive https://github.com/frankaemika/franka_ros src/franka_ros

cd ..
rosdep install --from-paths src --ignore-src --rosdistro kinetic -y --skip-keys libfranka

catkin_make -DCMAKE_BUILD_TYPE=Release
source devel/setup.sh
```
