#!/bin/bash
sudo cp ./update-sddm-wallpaper.sh /usr/local/sbin/update-sddm-wallpaper.sh
sudo chmod 0700 /usr/local/sbin/update-sddm-wallpaper.sh
sudo cp ./update-sddm-wallpaper.service /etc/systemd/system/update-sddm-wallpaper.service
systemctl start update-sddm-wallpaper.service
systemctl enable update-sddm-wallpaper.service