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
echo "Installing Terminator"
sudo apt install terminator
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
echo "Installing grub-customizer"
sudo apt-add-repository ppa:danielrichter2007/grub-customizer
sudo apt install grub-customizer
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
echo "Installing net-tools"
sudo apt install net-tools
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
