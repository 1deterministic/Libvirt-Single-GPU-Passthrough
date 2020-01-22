#!/usr/bin/bash

# installs the perfgovernor service
cp "./perfgovernor.service" "/etc/systemd/system"
systemctl daemon-reload

# installs the helper script
cp "./startvm-helper" "/usr/bin"
chown root:root "/usr/bin/startvm-helper"
chmod 755 "/usr/bin/startvm-helper"

# installs the starting script
cp "./startvm" "/usr/bin"
chown root:root "/usr/bin/startvm"
chmod 755 "/usr/bin/startvm"

echo "Done!"
