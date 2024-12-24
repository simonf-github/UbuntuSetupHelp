#doesnt work lol

# Force enable DP-1
xrandr --addmode DP-1 1920x1080
xrandr --output DP-1 --mode 1920x1080 --right-of eDP-1

# Force enable DP-2
xrandr --addmode DP-2 1920x1080
xrandr --output DP-2 --mode 1920x1080 --right-of DP-1

# Force enable HDMI-1
xrandr --addmode HDMI-1 1920x1080
xrandr --output HDMI-1 --mode 1920x1080 --left-of eDP-1
