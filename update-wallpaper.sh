#!/bin/bash

sleep 5

IMAGE_URL="https://wallpaper.bede.re/wallpaper.png"
USER=$(ls /home)
SAVE_PATH="/home/$USER/Pictures/wallpaper.png"
RETRY_DELAY=5

# Try downloading wallpaper until it succeeds
while true; do
    wget -q -N -O "$SAVE_PATH" "$IMAGE_URL"
    if [[ $? -eq 0 ]]; then
        break
    else
        sleep $RETRY_DELAY
    fi
done

# Update wallpaper
if [[ $EUID -ne 0 ]]; then
    /usr/bin/plasma-apply-wallpaperimage $SAVE_PATH
else
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $USER)/bus"
    runuser -u $USER -- /usr/bin/plasma-apply-wallpaperimage $SAVE_PATH
fi

# Update lock screen wallpaper
if [[ $EUID -ne 0 ]]; then
    kwriteconfig6 --file kscreenlockerrc --group Greeter --group Wallpaper --group org.kde.image --group General --key Image "file://$SAVE_PATH"
else
    runuser -u $USER -- kwriteconfig6 --file kscreenlockerrc --group Greeter --group Wallpaper --group org.kde.image --group General --key Image "file://$SAVE_PATH"
fi

# Update SDDM wallpaper
if [[ $EUID -eq 0 ]]; then
    cp $SAVE_PATH /usr/share/sddm/themes/breeze/wallpaper.png || true
fi