#!/bin/bash

IMAGE_URL="https://wallpaper.bede.re/wallpaper.png"
USER=$(ls /home)
SAVE_PATH="/home/$USER/Pictures/wallpaper.png"
RETRY_DELAY=5

while true; do
    wget -q -N -O "$SAVE_PATH" "$IMAGE_URL"
    if [ $? -eq 0 ]; then
        break
    else
        sleep $RETRY_DELAY
    fi
done

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $USER)/bus"
runuser -u $USER -- /usr/bin/plasma-apply-wallpaperimage $SAVE_PATH
runuser -u $USER -- kwriteconfig6 --file kscreenlockerrc --group Greeter --group Wallpaper --group org.kde.image --group General --key Image "file://$SAVE_PATH"

cp $SAVE_PATH /usr/share/sddm/themes/breeze/wallpaper.png || true
