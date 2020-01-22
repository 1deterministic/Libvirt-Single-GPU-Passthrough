#!/usr/bin/bash

# removes the perfgovernor service
rm "/etc/systemd/system/perfgovernor.service"
systemctl daemon-reload

# removes the helper script
rm "/usr/bin/startvm-helper"

# removes the starting script
rm "/usr/bin/startvm"

echo "Done!"
