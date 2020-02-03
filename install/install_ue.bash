#!/bin/bash

tmp=$(nvidia-settings --version| cut -d' ' -f 4)
NVIDIA_VERSION=$(echo $tmp| cut -d' ' -f 1)

if [ -z "$NVIDIA_VERSION" ]; then
    
    echo "No driver installed. Aborting."
    
else
    
    echo "Nvidia version $NVIDIA_VERSION installed. Proceeding with installation."
    
    sudo apt update
    
    echo "Installing Vulkan"
    sudo apt install vulkan-utils
    sudo apt install vulkan-tools
    
    cd ~/Documents/
    git clone https://github.com/EpicGames/UnrealEngine.git
    cd UnrealEngine/
    ./Setup.sh
    ./GenerateProjectFiles.sh
    make
    
    cd Engine/Binaries/Linux/

    ./UE4Editor
fi
