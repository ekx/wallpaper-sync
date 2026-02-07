#!/bin/bash
systemctl stop wallpaper-sync.service wallpaper-sync.timer
systemctl disable wallpaper-sync.service wallpaper-sync.timer
sudo rm /usr/local/sbin/update-wallpaper.sh
sudo rm /usr/lib/systemd/system/wallpaper-sync.service
sudo rm /usr/lib/systemd/system/wallpaper-sync.timer
