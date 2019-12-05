#!/bin/bash

OS="$(lsb_release -rs)"
echo $OS

echo "Performing upgrade"
sudo apt update
sudo apt full-upgrade

echo ""
echo "--------------------------------------------------"
echo "--------------------------------------------------"
if [ $OS = "18.04" ]; then
    echo "Installing guake from repository"
    sudo add-apt-repository ppa:linuxuprising/guake
    sudo apt update
else
    echo "Installing guake from default source"
fi
sudo apt install guake
sudo cp /usr/share/applications/guake.desktop /etc/xdg/autostart/
echo "--------------------------------------------------"
echo "--------------------------------------------------"
echo ""


echo ""
echo "--------------------------------------------------"
echo "--------------------------------------------------"
echo "Installing gnome tweak tool"
sudo apt install gnome-tweak-tool
echo "--------------------------------------------------"
echo "--------------------------------------------------"
echo ""

echo ""
echo "--------------------------------------------------"
echo "--------------------------------------------------"
echo "Installing htop"
sudo apt install htop
echo "--------------------------------------------------"
echo "--------------------------------------------------"
echo ""

echo ""
echo "--------------------------------------------------"
echo "--------------------------------------------------"
echo "Installing hardinfo"
sudo apt install hardinfo
echo "--------------------------------------------------"
echo "--------------------------------------------------"
echo ""


echo ""
echo "--------------------------------------------------"
echo "--------------------------------------------------"
echo "Installing Seafile Gui"
sudo add-apt-repository ppa:seafile/seafile-client
sudo apt update
sudo apt install seafile-gui
echo "--------------------------------------------------"
echo "--------------------------------------------------"
echo ""

echo ""
echo "--------------------------------------------------"
echo "--------------------------------------------------"
echo "Installing Shutter"
sudo apt install shutter
echo "--------------------------------------------------"
echo "--------------------------------------------------"
echo ""
