#!/bin/bash

# Define the applications to pin
apps=("org.gnome.Terminal" "code_code" "discord_discord" "spotify_spotify")

# Get the current favorites
current_favorites=$(gsettings get org.gnome.shell favorite-apps)

# Remove the trailing ']' and leading '['
current_favorites=$(echo "$current_favorites" | sed -e 's/^\[//' -e 's/\]$//')

# Add the new apps to the favorites
for app in "${apps[@]}"; do
    # Append .desktop to each app name
    app_desktop="$app.desktop"
    if [[ ! $current_favorites =~ $app_desktop ]]; then
        if [ -z "$current_favorites" ]; then
            current_favorites="'$app_desktop'"
        else
            current_favorites="$current_favorites, '$app_desktop'"
        fi
    fi
done

# Echo the current favorites
echo "Current favorites: [$current_favorites]"

# Update the favorites
gsettings set org.gnome.shell favorite-apps "[$current_favorites]"
