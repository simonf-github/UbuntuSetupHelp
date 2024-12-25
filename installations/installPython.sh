#!/bin/bash

# Update package list and install prerequisites
sudo apt update
sudo apt install -y software-properties-common

# Add deadsnakes PPA for Python 3.11
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update

# Install Python 3.11
sudo apt install -y python3.11

# Install pip for Python 3.11
sudo apt install -y python3.11-distutils
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3.11 get-pip.py
rm get-pip.py

sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
sudo update-alternatives --config python3


# Verify installations
python3.11 --version
python3 --version
pip3 --version

