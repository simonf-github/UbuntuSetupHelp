#!/bin/bash

# Function to log messages
log() {
    echo "[INFO] $1"
}

# Function to handle failures
handle_failure() {
    echo "[ERROR] $1"
    echo "Continuing with the next step..."
}

# Configure settings
log "Configuring system settings."

# Set Windows Key + Shift + S as the interactive screenshot tool
log "Setting Windows Key + Shift + S as the interactive screenshot tool."

# Define the custom keybinding path
custom_path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"

# Get the current list of custom keybindings
current_bindings=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)

# Add the new custom keybinding to the list
new_binding="'$custom_path'"
if [[ "$current_bindings" == "@as []" ]]; then
    updated_bindings="[$new_binding]"
else
    updated_bindings=$(echo "$current_bindings" | sed "s/]$/, $new_binding]/")
fi
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$updated_bindings" || handle_failure "Failed to update custom keybindings."

# Remove all existing keybindings using <Super><Shift>s
log "Removing conflicting keybindings for <Super><Shift>s."

# Search for existing keybindings using the desired combination
conflicts=$(gsettings list-recursively org.gnome.settings-daemon.plugins.media-keys | grep '<Super><Shift>s')

# Loop through conflicts and reset each keybinding
if [[ -n "$conflicts" ]]; then
    echo "$conflicts" | while read -r line; do
        schema=$(echo "$line" | awk '{print $1}')
        key=$(echo "$line" | awk '{print $2}')
        gsettings reset "$schema" "$key" || handle_failure "Failed to reset $schema $key."
    done
else
    log "No conflicting keybindings found for <Super><Shift>s."
fi

# Move the taskbar to the bottom of the screen
log "Moving the taskbar to the bottom of the screen."
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM || handle_failure "Failed to move the taskbar."

# Unpin Thunderbird Mail and Rhythmbox
log "Unpinning Thunderbird Mail and Rhythmbox."
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed "s/'thunderbird.desktop', //;s/, 'rhythmbox.desktop'//")" || handle_failure "Failed to unpin apps."

# Install applications
log "Installing applications."

# Install VSCode and Discord using snap
log "Installing VSCode and Discord using snap."
sudo snap install code --classic || handle_failure "Failed to install VSCode via snap."
sudo snap install discord || handle_failure "Failed to install Discord via snap."

# Install CopyQ
log "Installing CopyQ."
sudo apt install -y copyq || handle_failure "Failed to install CopyQ."

#install git
sudo apt install -y git

# Pin applications
log "Pinning applications to the taskbar."
CURRENT_FAVORITES=$(gsettings get org.gnome.shell favorite-apps | tr -d "[]'" | tr ',' '\n')
NEW_FAVORITES=$(echo -e "$CURRENT_FAVORITES\n'gnome-terminal.desktop'\n'update-manager.desktop'\n'code.desktop'\n'discord.desktop'" | awk '!seen[$0]++' | tr '\n' ',' | sed 's/,$//')
gsettings set org.gnome.shell favorite-apps "[$NEW_FAVORITES]" || handle_failure "Failed to pin applications."

# Launch applications
log "Launching applications."

# Open Gmail in Firefox
log "Opening Gmail in Firefox."
#firefox "https://mail.google.com" || handle_failure "Failed to open Gmail in Firefox."

log "Setup completed!"

