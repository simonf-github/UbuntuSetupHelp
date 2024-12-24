#not actually very effective

#!/bin/bash

# Function to log messages
log() {
    echo "[INFO] $1"
}

# Function to handle errors
error() {
    echo "[ERROR] $1"
    exit 1
}

# Step 1: Check connected and disconnected displays
log "Checking connected and disconnected displays using xrandr."
xrandr_output=$(xrandr)
echo "$xrandr_output"

# Step 2: List display configurations
log "Listing all display configurations."
xrandr --listmonitors

# Step 3: Check GPU information
log "Gathering GPU information."
gpu_info=$(lspci -k | grep -EA3 'VGA|3D|Display')
echo "$gpu_info"

# Step 4: Check active kernel modules for GPU
log "Checking loaded kernel modules for GPU drivers."
lsmod | grep -E 'i915|nvidia|amdgpu'

# Step 5: Check logs for DRM-related errors
log "Checking dmesg logs for DRM-related errors."
dmesg | grep drm

# Step 6: Check GNOME display settings
log "Checking GNOME display settings."
gsettings list-recursively org.gnome.desktop.interface | grep 'scaling-factor'
dconf dump /org/gnome/desktop/monitor/

# Step 7: Check for Xorg errors (if applicable)
if [ -f /var/log/Xorg.0.log ]; then
    log "Checking Xorg log for errors."
    grep -i 'error' /var/log/Xorg.0.log
else
    log "Xorg log file not found. Skipping."
fi

# Step 8: Check Wayland sessions (if applicable)
log "Checking for active Wayland sessions."
ps -e | grep wayland

# Step 9: Check display manager status
log "Checking display manager status."
systemctl status display-manager

# Step 10: Summarize connected devices
log "Listing connected USB and PCI devices."
lspci
lsusb

log "Investigation completed. Review the outputs for any issues."
