#!/usr/bin/bash

# removes the perfgovernor service
sudo rm "/etc/systemd/system/perfgovernor.service"
sudo systemctl daemon-reload

# removes the helper script
sudo rm "/usr/bin/lsgp-helper"

# removes the starting script
sudo rm "/usr/bin/lsgp"

echo "Done!"
