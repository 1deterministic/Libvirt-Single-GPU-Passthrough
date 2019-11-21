# Libvirt-Single-GPU-Passthrough

## Intro
This repo contains my personal configs on Libvirt **single** GPU passthrough, stripped down to the most generic way possible. Here you will find templates and files you can customize to your liking if you have similar hardware or take a look at the options to build your own configuration if you don't.

## How to use this repo
* In `Domains/` you will find everything related to `.xml` domain definitions, organized in the following way: `Domains/Motherboard/GraphicsCard/OperatingSystem.xml`. These files contain templates you can tweak if you happen to have the same hardware or use as a reference if you don't. The most important thing here is the motherboard as the `.xml` passthrough structure depends on them. 

  I should also mention that these files include passthrough not only of the graphics card but also the onboard sound and all usb controllers, given that they also depend on the motherboard.

  The `Domains/Motherboard/GraphicsCard/` folder also contains the apropriate kernel parameters you should use for this configuration.

  Also in `Domains/` you will find `Drive Presets.txt` and `Network Presets.txt`. They have generic device `xml` code you can use in any Libvirt virtual machine.

* In `Firmware/` you will find device firmwares you can use, named by full device name and rom version. There is an exception though, that is `OVMF_MAC.fd`. This is an OVMF version specific for use in macOS virtual machines (thanks simple-macOS-dajndkjanskjdnak), instructions for its use are in `Domains/Motherboard/GraphicsCard/macOS.xml`

* `Bootloaders/` conains, well, bootloaders for specific operating systems. At the moment the only case is the Clover bootloader for macOS.

* `NVRAM/` contains `_VARS.fd files`, wich hold UEFI variables for the virtual machines. This is only needed if using custom OVMF, such as macOS.

* `perfgovernor.service` is a systemd service that sets the processor frequency governor to performance when it's active and powersave when it's not active. The `startvmforrealthistime` script automatically starts if before running a virtual machine and stops it when the vm is closed, so you don't need to have it running all the time.

* `startvm` is a bash scripts that starts a specified virtual machine passed as argument by name. This is the file you will run to start vms from an unprivileged user terminal (given it has access to sudo). The problem is, for it to correctly logout the running user and stay alive until the virtual machine stops to start the display manager again, it had to be splitted. So the only thing this file does is calling `startvmforrealthistime` with the correct info and detached from the terminal.

* `startvmforrealthistime` is a bash script that actually starts the virtual machine and waits until it has stopped to start the display manager again. Don't run it directly, use `startvm` instead.

* `install.sh` will install the 2 scripts for starting virtual machines and the `perfgovernor` service.