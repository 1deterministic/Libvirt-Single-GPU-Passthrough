#!/usr/bin/bash

# removes the perfgovernor service
rm "/etc/systemd/system/perfgovernor.service"
systemctl daemon-reload

# removes the helper script
rm "/usr/sbin/startvm-helper"

# removes the starting script
rm "/usr/sbin/startvm"
