#!/bin/bash

# Function to log messages
log() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $1"
}

# Function to handle failures
handle_failure() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - ERROR: $1"
}

# Launch applications
log "Launching applications."

# Open Gmail in Firefox 2x
log "Opening Gmail in Firefox."
firefox --new-tab "https://mail.google.com" & disown || handle_failure "Failed to open Gmail in Firefox."

# Open Canvas in Firefox
log "Opening Canvas in Firefox."
firefox --new-tab "https://canvas.case.edu/" & disown || handle_failure "Failed to open Canvas in Firefox."

# Open Google Drive in Firefox 2x
log "Opening Google Drive in Firefox."
firefox --new-tab "https://drive.google.com/drive/home" & disown || handle_failure "Failed to open Google Drive in Firefox."

# Open Slack in Firefox
log "Opening Slack in Firefox."
firefox --new-tab "https://app.slack.com/client/T0648Q4UU4R/C064K542D9N" & disown || handle_failure "Failed to open Slack in Firefox."

# Open ChatGPT in Firefox
log "Opening ChatGPT in Firefox."
firefox --new-tab "https://chatgpt.com/" & disown || handle_failure "Failed to open ChatGPT in Firefox."

# Open GitHub in Firefox
log "Opening GitHub in Firefox."
firefox --new-tab "https://github.com/simonf-github" & disown || handle_failure "Failed to open GitHub in Firefox."

log "All applications launched successfully."
