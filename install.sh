#!/bin/bash

# create destination folder
sudo mkdir "/usr/share/libvirt/lsgp"

# copy files
sudo cp -r "./bootloaders" "/usr/share/libvirt/lsgp"
sudo cp -r "./firmware" "/usr/share/libvirt/lsgp"
sudo cp -r "./nvram" "/usr/share/libvirt/lsgp"
sudo cp "./scripts/lsgp" "/usr/bin"
sudo cp "./scripts/lsgp.conf" "/etc"
sudo cp "./services/lsgp@.service" "/etc/systemd/system"

# fix permissions
find "/usr/share/libvirt/lsgp" -type d -exec sudo chmod 755 "{}" \;
find "/usr/share/libvirt/lsgp" -type f -exec sudo chmod 644 "{}" \;
sudo chmod 755 "/usr/bin/lsgp"
sudo chmod 644 "/etc/lsgp.conf"
sudo chmod 644 "/etc/systemd/system/lsgp@.service"

# reload services
sudo systemctl daemon-reload
