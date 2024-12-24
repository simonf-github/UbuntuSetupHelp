#!/bin/bash

# Find the Windows EFI entry
WINDOWS_ENTRY=$(efibootmgr | grep -i "windows boot manager" | awk '{print $1}' | sed 's/\*//g')

if [ -z "$WINDOWS_ENTRY" ]; then
  echo "Error: Could not find a Windows Boot Manager entry."
  exit 1
fi

# Set the Windows Boot Manager as the next boot entry
WINDOWS_ENTRY=${WINDOWS_ENTRY:4}  # Remove "Boot" prefix
sudo efibootmgr --bootnext "$WINDOWS_ENTRY"

if [ $? -eq 0 ]; then
  echo "Successfully set Windows Boot Manager as the next boot option."
  echo "Rebooting now..."
  sudo reboot
else
  echo "Failed to set the Windows Boot Manager as the next boot option."
  exit 1
fi
