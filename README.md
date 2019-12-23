# Libvirt-Single-GPU-Passthrough

## Intro
This repo contains my personal configs on Libvirt **single** GPU passthrough, stripped down to the most generic way possible. Here you will find templates and files you can customize if you have similar hardware or take a look to build your own configuration if you don't.

## Project organization

### Bootloaders
This folder contains disk images for loading operating systems.

### Domains
This folder contains .xml files and config snippets you can use to build a customized virtual machine, including notes I make as time goes by. You will find those snippets organized by motherboard and its folders can also contain specific snippets by device being passed through.

These configs require some editting before using, specially for values I decided not to set due to being coupled to specific needs of every different user, things like ram amount, core count, path to disk images and so on. These values are represented by text between `::`, like `::UUID::`. The idea is that you can pick .xml code from various places and build a custom file. A summary of values is located [here](./Values.md).

### Firmware
This folder contains device firmware blobs required for correct use inside virtual machines, such as graphics card BIOSes. It also contains a version of OVMF UEFI required on macOS virtual machines.

### NVRAM
This folder contains NVRAM entries for specific OVMF UEFI firmwares.

### Scripts
This folder contains scripts, configs and services that will help making the process of starting a virtual machine require less manual input.