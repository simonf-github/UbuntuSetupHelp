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

# Reduce mouse sensitivity persistently
reduce_mouse_sensitivity_persistent() {
    log "Attempting to set persistent mouse sensitivity reduction."

    # Desired sensitivity (adjust between -1.0 to 1.0; -1.0 is slowest, 1.0 is fastest)
    desired_sensitivity=-.45

    # Set sensitivity using gsettings (Persistent in GNOME)
    gsettings set org.gnome.desktop.peripherals.mouse speed "$desired_sensitivity" || handle_failure "Failed to set persistent mouse sensitivity."

    log "Persistent mouse sensitivity set to $desired_sensitivity."
}

# Run the function to set sensitivity
reduce_mouse_sensitivity_persistent


# set super (windows key) + shift + s to interactive screenshot
# Define the custom keybinding path
custom_path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
screenshot_command="gnome-screenshot --area"

# Remove any existing keybinding conflicts for <Super><Shift>S
existing_binding=$(gsettings list-recursively org.gnome.settings-daemon.plugins.media-keys | grep "<Super><Shift>s")
if [[ -n "$existing_binding" ]]; then
    echo "[INFO] Conflict detected for <Super><Shift>S. Removing existing binding."
    if echo "$existing_binding" | grep -q "custom-keybindings"; then
        conflicting_path=$(echo "$existing_binding" | awk -F"'" '{print $2}')
        gsettings reset org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"$conflicting_path" binding
    else
        echo "[ERROR] Conflict with a system-level binding. Manual resolution required."
        exit 1
    fi
else
    echo "[INFO] No conflicts detected for <Super><Shift>S."
fi

# Add the custom keybinding
 gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Super><Shift>s']"

#turn off screenshot and other annoying sounds
gsettings set org.gnome.settings-daemon.plugins.sound input-feedback-sounds false