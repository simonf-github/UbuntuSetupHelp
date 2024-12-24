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

# Unpin Thunderbird Mail and Rhythmbox
log "Unpinning Thunderbird Mail and Rhythmbox."
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed "s/'thunderbird.desktop', //;s/, 'rhythmbox.desktop'//")" || handle_failure "Failed to unpin Thunderbird Mail and Rhythmbox."

log "Successfully unpinned Thunderbird Mail and Rhythmbox."
