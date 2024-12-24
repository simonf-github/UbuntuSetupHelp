#!/bin/bash

# Update the package list
sudo apt update

# Install the necessary tools
sudo apt install -y ubuntu-drivers-common

# Detect and show the recommended drivers
echo "Detecting recommended drivers..."
ubuntu-drivers devices

# Install the recommended drivers
echo "Installing recommended drivers..."
sudo ubuntu-drivers autoinstall

# Reboot the system to apply changes
echo "Rebooting the system to apply changes..."
sudo reboot