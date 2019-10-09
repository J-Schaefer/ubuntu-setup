#!/bin/bash
#value=$(<passed.dat)


OS="$(lsb_release -rs)"
echo $OS

echo "Performing upgrade"
sudo apt update
sudo apt full-upgrade

if [ $OS = "18.04" ]; then
    echo "Installing ROS Melodic"
    echo "--------------------------------------------------"
    cd ~
    
    echo "Looking for ROS Melodic installation"
    
    
    DIRECTORY="/opt/ros/melodic"
    #echo $DIRECTORY
    
    
    if [ -d "$DIRECTORY" ]; then
        # Control will enter here if $DIRECTORY exists.
        echo "ROS Melodic allready installed, skipping this"
        echo "--------------------------------------------------"
    else
        echo "Installing Melodic - this might take a while"
        sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
        
        sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
        
        sudo apt-get update
        
        sudo apt install ros-melodic-desktop-full
        
        sudo rosdep init
        
        rosdep update
        
        echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
        source ~/.bashrc
        echo $ROS_PACKAGE_PATH
        
        echo "Installing additional Dependencies"
        
        sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential
        
        echo "Setting up catkin workspace"
        
        mkdir -p ~/catkin_ws/src
        cd ~/catkin_ws
        catkin_make
        
        source devel/setup.bash
        echo "Writing this to the .bashrc"
        sudo echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
        
    fi
    
    echo "Finished installing all requirements"
    echo "--------------------------------------------------"
    echo "--------------------------------------------------"
    
else
    
    echo "WRONG OPERATING SYSTEM VERSION - ABORTING"
    
fi

echo "Installing guake"
sudo apt-get install guake
sudo cp /usr/share/applications/guake.desktop /etc/xdg/autostart/

echo "Installing gnome tweak tool"
sudo apt-get install gnome-tweak-tool

echo "Installing gnome tweak tool"
sudo add-apt-repository ppa:seafile/seafile-client
sudo apt-get update
sudo apt-get install seafile-gui
