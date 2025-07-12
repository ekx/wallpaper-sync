#!/bin/bash

IMAGE_URL="https://wallpaper.bede.re/wallpaper.png"
USER=$(ls /home)
SAVE_PATH="/home/$USER/Pictures/wallpaper.png"
RETRY_DELAY=5

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $USER)/bus"

while true; do
    wget -q -N -O "$SAVE_PATH" "$IMAGE_URL"
    if [ $? -eq 0 ]; then
        break
    else
        sleep $RETRY_DELAY
    fi
done


runuser -u $USER -- /usr/bin/plasma-apply-wallpaperimage $SAVE_PATH
#qdbus org.kde.ScreenLocker /ScreenLocker org.kde.ScreenLocker.SetWallpaperFromFile $SAVE_PATH

cp $SAVE_PATH /usr/share/sddm/themes/breeze/wallpaper.png || true
