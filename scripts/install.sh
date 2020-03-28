#!/usr/bin/bash

# installs the perfgovernor service
sudo cp "./perfgovernor.service" "/etc/systemd/system"
sudo systemctl daemon-reload

# installs the helper script
sudo cp "./startvm-helper" "/usr/bin"
sudo chown root:root "/usr/bin/startvm-helper"
sudo chmod 755 "/usr/bin/startvm-helper"

# installs the starting script
sudo cp "./startvm" "/usr/bin"
sudo chown root:root "/usr/bin/startvm"
sudo chmod 755 "/usr/bin/startvm"

echo "Done!"
