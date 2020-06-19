#!/bin/bash

# remove all files
sudo rm -r "/usr/share/libvirt/lsgp"
sudo rm "/usr/bin/lsgp"
sudo rm "/etc/lsgp.conf"
sudo rm "/etc/systemd/system/lsgp@.service"

# reload services
sudo systemctl daemon-reload
