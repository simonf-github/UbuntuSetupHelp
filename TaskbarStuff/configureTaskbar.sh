#!/bin/bash

# Function for logging
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] $1"
}

# Function for handling failures
handle_failure() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [ERROR] $1"
    exit 1
}

# Move the taskbar to the bottom of the screen
log "Moving the taskbar to the bottom of the screen."
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM' || handle_failure "Failed to move the taskbar."
log "Taskbar successfully moved to the bottom of the screen."


# Center the apps on the taskbar (doesnt work, fix later or not?)
# log "Centering apps on the taskbar."
# sudo add-apt-repository universe -y || handle_failure "Failed to add universe repository."
# sudo apt update || handle_failure "Failed to update package list."
# sudo apt install gnome-shell-extensions -y || handle_failure "Failed to install GNOME Shell extensions."
# log "Enabling Dash to Dock extension."
# gnome-extensions enable dash-to-dock@micxgx.gmail.com || handle_failure "Failed to enable the Dash to Dock extension."
# gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
# gsettings set org.gnome.shell.extensions.dash-to-dock center-aligned true || handle_failure "Failed to center-align the taskbar."
# log "Apps successfully centered on the taskbar."