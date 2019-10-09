#!/bin/bash

OS="$(lsb_release -rs)"
echo $OS

if [ $OS = "18.04" ]; then
    
    sudo apt install build-essential cmake git libpoco-dev libeigen3-dev
    
    cd ~/Documents/
    git clone --recursive https://github.com/frankaemika/libfranka
    cd libfranka
    
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    cmake --build .
    
    cd ~/catkin_ws/src/
    git clone --recursive https://github.com/frankaemika/franka_ros src/franka_ros
    
    cd ..
    rosdep install --from-paths src --ignore-src --rosdistro kinetic -y --skip-keys libfranka
    
    catkin_make -DCMAKE_BUILD_TYPE=Release -DFranka_DIR:PATH=~/Documents/libfranka/build
    source devel/setup.sh
    
else
    
    echo "You're on the wrong OS. Aborting."
    
fi
