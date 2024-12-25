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
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed "s/'libreoffice-writer.desktop', //;s/, 'libreoffice-writer.desktop'//")"
log "Successfully unpinned Thunderbird Mail and Rhythmbox."
