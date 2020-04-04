#!/usr/bin/bash

# installs the perfgovernor service
sudo cp "./perfgovernor.service" "/etc/systemd/system"
sudo systemctl daemon-reload

# installs the helper script
sudo cp "./lsgp-helper" "/usr/bin"
sudo chown root:root "/usr/bin/lsgp-helper"
sudo chmod 755 "/usr/bin/lsgp-helper"

# installs the starting script
sudo cp "./lsgp" "/usr/bin"
sudo chown root:root "/usr/bin/lsgp"
sudo chmod 755 "/usr/bin/lsgp"

echo "Done!"
