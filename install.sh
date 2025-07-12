#!/bin/bash
sudo cp ./update-wallpaper.sh /usr/local/sbin/update-wallpaper.sh
sudo chmod 0700 /usr/local/sbin/update-wallpaper.sh
sudo cp ./wallpaper-sync.service /etc/systemd/system/wallpaper-sync.service
systemctl start wallpaper-sync.service
systemctl enable wallpaper-sync.service