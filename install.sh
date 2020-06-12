#!/bin/bash

# folder where you store disk images and iso files
disksDir="/path/to/disks-dir"
isosDir="/path/to/isos-dir"

# create destination folder
sudo mkdir "/usr/share/libvirt/lsgp"

# copy files
sudo cp -r "./bootloaders" "/usr/share/libvirt/lsgp"
sudo cp -r "./firmware" "/usr/share/libvirt/lsgp"
sudo cp -r "./nvram" "/usr/share/libvirt/lsgp"
sudo ln -s "$disksDir" "/usr/share/libvirt/lsgp/disks"
sudo ln -s "$isosDir" "/usr/share/libvirt/lsgp/isos"
sudo cp "./scripts/lsgp-helper" "/usr/bin"
sudo cp "./scripts/lsgp" "/usr/bin"

# fix permissions
find "/usr/share/libvirt/lsgp" -type d -exec sudo chmod 755 "{}" \;
find "/usr/share/libvirt/lsgp" -type f -exec sudo chmod 644 "{}" \;
sudo chmod 755 "/usr/bin/lsgp-helper"
sudo chmod 755 "/usr/bin/lsgp"
