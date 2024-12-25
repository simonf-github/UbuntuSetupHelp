#!/bin/bash

# Function to print messages
function print_message() {
    echo "============================================================"
    echo "$1"
    echo "============================================================"
}

# Update system packages
print_message "Updating system packages"
sudo apt update && sudo apt upgrade -y

#install Nautilus extension thing
sudo apt install python3-nautilus -y

# Install Nautilus extensions
print_message "Installing Nautilus extensions"
sudo apt install -y nautilus-extensions xclip python3 python3-pip

# Install Python dependencies
print_message "Installing Python dependencies for CopyAsPathExtension"
pip3 install pyperclip notify2
sudo apt install xclip -y

# Create the Nautilus Python extension directory
print_message "Setting up 'Copy as Path' Python Nautilus extension"
EXTENSION_DIR="$HOME/.local/share/nautilus-python/extensions"
mkdir -p "$EXTENSION_DIR"

# Copy the provided Python script to the extension directory
PYTHON_SCRIPT_PATH="./copyAsPath.py" # Adjusted to reference the same directory as this script
if [ -f "$PYTHON_SCRIPT_PATH" ]; then
    cp "$PYTHON_SCRIPT_PATH" "$EXTENSION_DIR"
    print_message "Python script 'copyAsPath.py' has been copied to Nautilus extensions directory."
else
    echo "Error: Python script 'copyAsPath.py' not found in the current directory."
    exit 1
fi

# Restart Nautilus to apply changes
print_message "Restarting Nautilus"
nautilus -q

print_message "'Copy as Path' functionality has been added to Nautilus. Select a file or folder, right-click, and choose 'Copy as Path' to copy its path to the clipboard."
