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

gsettings set org.gnome.shell.keybindings toggle-message-tray "['<Super>m']"
echo 'removed super V as shortcut'
echo 'Open CopyQ and turn autostart on.'
echo 'CopyQ>Preferences>General>Autostart (check this box)'
echo 'Set the shortcut for CopyQ to Super+V'
echo 'File>Commands/Global Shortcuts> + Add Show main window under mouse cursor zshortcut: Super+V'

# # Define the custom keybinding path
# gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"

# # Set the name of the keybinding
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 name 'CopyQ Shortcuv'

# # Set the command for the keybinding
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 command 'copyq show'

# # Set the keybinding itself
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 binding '<Super>v'
