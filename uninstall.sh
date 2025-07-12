#!/bin/bash
systemctl stop wallpaper-sync.service
systemctl disable wallpaper-sync.service
sudo rm /usr/local/sbin/update-wallpaper.sh
sudo rm /etc/systemd/system/wallpaper-sync.service
