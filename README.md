# Libvirt-Single-GPU-Passthrough

## Intro
This repo contains my personal configs on Libvirt **single** GPU passthrough, stripped down to the most generic way possible. Here you will find templates and files you can customize if you have similar hardware or take a look to build your own configuration if you don't.

Unfortunately I have only used gpu passthrough on my personal machine, so there is only one motherboard and graphics card listed. I intend to keep this project updated when I eventually upgrade my machine but until then it will probably stay like this. PRs are welcome if you want to contribute with your personal configuration.

## Project organization
All files are located in the `sysroot` folder exactly where they will be placed when installed to the root of the filesystem.

* `/etc/lsgp.conf` is the starting script config file - modules to unbind, pre and post run scripts, hugepages allocation and others are configured here.

* `/etc/systemd/system/lsgp@.service` is the systemd service that will actually run the starting script. This is necessary to keep the script alive even after the terminal window is closed. This also has the convenient side effect of keeping track of the script log acessible through systemctl status. **DO NOT ENABLE THIS SERVICE** unless you know what you're doing.

* `/usr/bin/lsgp` is the starting script, nothing here needs to be changed before running, use `/etc/lsgp.conf` instead.

* `/usr/share/libvirt/lsgp/bootloaders` contains standalone bootloaders, it currently contains only the Clover bootloader (from **[foxlet/macOS-Simple-KVM](https://github.com/foxlet/macOS-Simple-KVM)**).

* `/usr/share/libvirt/lsgp/examples` contains xml files and config snippets you can use to build a customized virtual machine, including notes I take as time goes by. These configs require some editting before using for values coupled to specific user needs, things like ram amount, core count, path to disk images and so on.

* `/usr/share/libvirt/lsgp/firmware` contains device firmware blobs required for correct use inside virtual machines, such as graphics card BIOSes. It also contains some specific versions of OVMF I had success using and a version of OVMF tuned for macOS virtual machines (from **[foxlet/macOS-Simple-KVM](https://github.com/foxlet/macOS-Simple-KVM)**).

* `/usr/share/libvirt/lsgp/nvram` contains NVRAM presets for the OVMF UEFI firmwares in the `/usr/share/libvirt/lsgp/firmware/uefi` folder.

## So, how do I use this?
* First you need to place all files in their correct folders. Download the latest release, extract it somewhere and then open a terminal in the extracted folder and run:
```
sudo ./install.sh
```

* Customize the configuration file at `/etc/lsgp.conf` with the settings you need.

* You need to build an xml file for the VM you want to run. You can use the presets in the `/usr/share/libvirt/lsgp/examples` folder as a base and add xml from `/usr/share/libvirt/lsgp/examples/emulated` for emulated devices and `/usr/share/libvirt/lsgp/examples/physical` for physical devices grouped by motherboard and category. This probably will not be enough for your VM as this project only has xml for devices I own, so you have to manually add code for devices not included here (but you can use mine as a reference). When the xml is done, define a virtual machine by using:
```
sudo virsh define file.xml
```

* Start your virtual machine with the following code, replacing `virtualmachine` with your virtual machine domain name:
```
sudo systemctl start lsgp@virtualmachine.service
```

When you want to return to the host, just turn off the guest OS.
