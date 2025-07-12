#!/bin/bash

IMAGE_URL="https://wallpaper.bede.re/wallpaper.png"
SAVE_PATH="/tmp/wallpaper.png"
RETRY_DELAY=5

while true; do
    wget -q -N -O "$SAVE_PATH" "$IMAGE_URL"
    if [ $? -eq 0 ]; then
        break
    else
        sleep $RETRY_DELAY
    fi
done

USER=$(logname)
runuser -u $USER -- /usr/bin/plasma-apply-wallpaperimage /tmp/wallpaper.png
#qdbus org.kde.ScreenLocker /ScreenLocker org.kde.ScreenLocker.SetWallpaperFromFile "/tmp/wallpaper.png"

cp /tmp/wallpaper.png /usr/share/sddm/themes/breeze/wallpaper.png
