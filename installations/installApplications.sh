#install commonly useful applications to the system

#!/bin/bash

# Function to log messages
log() {
    echo "============================================================"
    echo "$1"
    echo "============================================================"
}

# Function to handle failures
handle_failure() {
    echo "ERROR: $1"
    exit 1
}

# Update system
log "Updating system packages."
sudo apt update -y && sudo apt upgrade -y || handle_failure "Failed to update and upgrade system packages."




# Install VSCode and Discord using snap
log "Installing VSCode and Discord using snap."
sudo snap install code --classic || handle_failure "Failed to install VSCode via snap."
sudo snap install discord || handle_failure "Failed to install Discord via snap."

# Install Spotify using snap
log "Installing Spotify using snap."
sudo snap install spotify || handle_failure "Failed to install Spotify via snap."

# Install CopyQ
log "Installing CopyQ."
sudo apt install -y copyq || handle_failure "Failed to install CopyQ."

# Install Git
log "Installing Git."
sudo apt install -y git || handle_failure "Failed to install Git."

log "All applications have been successfully installed."

# Install python
sudo apt update && sudo apt install -y python3 python3-pip && python3 --version
