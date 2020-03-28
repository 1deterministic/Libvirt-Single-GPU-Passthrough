# Libvirt-Single-GPU-Passthrough

## Intro
This repo contains my personal configs on Libvirt **single** GPU passthrough, stripped down to the most generic way possible. Here you will find templates and files you can customize if you have similar hardware or take a look to build your own configuration if you don't.

Unfortunately I have only used gpu passthrough on my personal machine, so there is only one motherboard and graphics card listed. I intend to keep this project updated when I eventually upgrade my machine but until then it will probably stay like this.

## Project organization

### bootloaders
This folder contains disk images for loading operating systems.

### domains
This folder contains .xml files and config snippets you can use to build a customized virtual machine, including notes I take as time goes by. You will find those snippets organized by motherboard and its folders can also contain specific snippets by device being passed through.

These configs require some editting before using for values coupled to specific user needs, things like ram amount, core count, path to disk images and so on.

### firmware
This folder contains device firmware blobs required for correct use inside virtual machines, such as graphics card BIOSes. It also contains a version of OVMF UEFI required on macOS virtual machines.

### nvram
This folder contains NVRAM presets for specific OVMF UEFI firmwares.

### scripts
This folder contains scripts, configs and services that will help making the process of starting a virtual machine require less manual input.