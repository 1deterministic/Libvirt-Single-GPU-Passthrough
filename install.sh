#!/usr/bin/bash

# installs the perfgovernor service
cp "./perfgovernor.service" "/etc/systemd/system"
systemctl daemon-reload

# installs the run scripts
cp "./startvm" "/usr/sbin"
chown root:root "/usr/sbin/startvm"
chmod 755 "/usr/sbin/startvm"
cp "./startvm-helper" "/usr/sbin"
chown root:root "/usr/sbin/startvm-helper"
chmod 755 "/usr/sbin/startvm-helper"
