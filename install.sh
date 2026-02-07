#!/bin/bash
sudo cp ./update-wallpaper.sh /usr/local/sbin/update-wallpaper.sh
sudo chmod 0700 /usr/local/sbin/update-wallpaper.sh
sudo cp ./wallpaper-sync.service /usr/lib/systemd/system/wallpaper-sync.service
sudo cp ./wallpaper-sync.timer /usr/lib/systemd/system/wallpaper-sync.timer
systemctl enable wallpaper-sync.service wallpaper-sync.timer
systemctl start wallpaper-sync.service wallpaper-sync.timer
