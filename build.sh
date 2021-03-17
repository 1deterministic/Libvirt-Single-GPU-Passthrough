#!/bin/bash

fakeroot -- << 'EOF'
pkgname="lsgp"

# fix permissions
# general
find "./sysroot" -type d -exec chmod 755 {} \;
find "./sysroot" -type l -exec chmod 755 {} \;
find "./sysroot" -type f -exec chmod 644 {} \;

# package sysroot
cd "./sysroot"
tar --create "."/* | GZIP_OPT=-9 gzip >> "../sysroot.tar.gz"
cd ".."

# package install script and sysroot together
tar --create "./README.md" "./LICENSE" "./install.sh" "./changelog.txt" "./sysroot.tar.gz" | cat >> "./$pkgname.tar"

# remove zipped sysroot
rm "./sysroot.tar.gz"
EOF
