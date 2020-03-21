#!/bin/bash

echo "Performing upgrade"
sudo apt update
sudo apt full-upgrade

OS="$(lsb_release -rs)"
echo $OS

if [ $OS = "18.04" ]; then
    echo ""
    echo "--------------------------------------------------"
    echo "--------------------------------------------------"
    echo "Installing ROS Melodic"
    echo "--------------------------------------------------"
    echo "--------------------------------------------------"
    echo ""
    cd $HOME
    
    echo "Looking for ROS Melodic installation"
    
    
    DIRECTORY="/opt/ros/melodic"
    #echo $DIRECTORY
    
    
    if [ -d "$DIRECTORY" ]; then
        # Control will enter here if $DIRECTORY exists.
        echo ""
        echo "--------------------------------------------------"
        echo "--------------------------------------------------"
        
        echo "ROS Melodic allready installed, skipping this"
        echo "--------------------------------------------------"
        echo "--------------------------------------------------"
        echo ""
    else
        echo "Installing Melodic - this might take a while"
        sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
        
        sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
        
        sudo apt update
        
        sudo apt install ros-melodic-desktop-full
        
        sudo apt install python-catkin-tools
        
        source /opt/ros/medlodic/setup.bash
        echo "source /opt/ros/melodic/setup.bash" >> $HOME/.bashrc
        source $HOME/.bashrc
        echo $ROS_PACKAGE_PATH
        
        sudo rosdep init
        rosdep update
        
        echo ""
        echo "--------------------------------------------------"
        echo "--------------------------------------------------"
        echo "Installing additional Dependencies"
        
        sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential
        
        echo ""
        echo "--------------------------------------------------"
        echo "--------------------------------------------------"
        echo "Setting up catkin workspace"
        
        mkdir -p $HOME/ros_ws/catkin_ws/src
        cd $HOME/ros_ws/catkin_ws
        catkin build
        
        source devel/setup.bash
        echo "Writing this to the .bashrc"
        sudo echo "source $HOME/ros_ws/catkin_ws/devel/setup.bash" >> $HOME/.bashrc
        
    fi
    
    echo ""
    echo "--------------------------------------------------"
    echo "--------------------------------------------------"
    echo "Finished installing all requirements"
    echo "--------------------------------------------------"
    echo "--------------------------------------------------"
    echo ""
    
    elif [ $OS = "16.04" ]; then
    
    echo ""
    echo "--------------------------------------------------"
    echo "--------------------------------------------------"
    echo "Installing ROS Kinetic"
    echo "--------------------------------------------------"
    echo "--------------------------------------------------"
    echo ""
    cd $HOME
    
    echo "Looking for ROS Kinetic installation"
    
    
    DIRECTORY="/opt/ros/kinetic"
    #echo $DIRECTORY
    
    
    if [ -d "$DIRECTORY" ]; then
        # Control will enter here if $DIRECTORY exists.
        echo ""
        echo "--------------------------------------------------"
        echo "--------------------------------------------------"
        
        echo "ROS Kinetic allready installed, skipping this"
        echo "--------------------------------------------------"
        echo "--------------------------------------------------"
        echo ""
    else
        echo "Installing Kinetic - this might take a while"
        sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
        
        sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
        
        sudo apt-get update
        
        sudo apt-get install ros-kinetic-desktop-full
        
        sudo apt-get install python-catkin-tools
        
        source /opt/ros/kinetic/setup.bash
        echo "source /opt/ros/kinetic/setup.bash" >> $HOME/.bashrc
        source $HOME/.bashrc
        echo $ROS_PACKAGE_PATH
        
        sudo rosdep init
        rosdep update
        
        echo ""
        echo "--------------------------------------------------"
        echo "--------------------------------------------------"
        echo "Installing additional Dependencies"
        
        sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential
        
        echo ""
        echo "--------------------------------------------------"
        echo "--------------------------------------------------"
        echo "Setting up catkin workspace"
        
        mkdir -p $HOME/ros_ws/catkin_ws/src
        cd $HOME/ros_ws/catkin_ws
        catkin build
        
        source devel/setup.bash
        echo "Writing this to the .bashrc"
        sudo echo "source $HOME/ros_ws/catkin_ws/devel/setup.bash" >> $HOME/.bashrc
        
    fi
    
    echo ""
    echo "--------------------------------------------------"
    echo "--------------------------------------------------"
    echo "Finished installing all requirements"
    echo "--------------------------------------------------"
    echo "--------------------------------------------------"
    echo ""
    
else
    
    echo "Wrong operating system version - aborting."
    
fi
