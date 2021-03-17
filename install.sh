#!/bin/bash

if [[ "$(whoami)" != "root" ]]; then
    echo "Please run this script as root."
    exit 1
fi

# extract all files to root
cat "./sysroot.tar.gz" | gzip -d | tar --extract --directory "/" &&

# reload systemd services
systemctl daemon-reload &&

echo "Done!"
