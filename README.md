# Libvirt-Single-GPU-Passthrough

## Intro
This repo contains my personal configs on Libvirt **single** GPU passthrough, stripped down to the most generic way possible. Here you will find templates and files you can customize if you have similar hardware or take a look to build your own configuration if you don't.

Unfortunately I have only used gpu passthrough on my personal machine, so there is only one motherboard and graphics card listed. I intend to keep this project updated when I eventually upgrade my machine but until then it will probably stay like this.

## Project organization

### bootloaders
This folder contains disk images for loading operating systems. At the moment, it only has a `.qcow2` file for the clover bootloader (from **[foxlet/macOS-Simple-KVM](https://github.com/foxlet/macOS-Simple-KVM)**).

### domains
This folder contains .xml files and config snippets you can use to build a customized virtual machine, including notes I take as time goes by. You will find those snippets organized by motherboard and its folders can also contain specific snippets by device being passed through.

These configs require some editting before using for values coupled to specific user needs, things like ram amount, core count, path to disk images and so on.

### firmware
This folder contains device firmware blobs required for correct use inside virtual machines, such as graphics card BIOSes. It also contains some specific versions of OVMF I had success using and a version of OVMF tuned for macOS virtual machines (from **[foxlet/macOS-Simple-KVM](https://github.com/foxlet/macOS-Simple-KVM)**).

### nvram
This folder contains NVRAM presets for the OVMF UEFI firmwares in the `firmware` folder.

### scripts
This folder contains the script used to start virtual machines and its config file.

### services
This folder contains the systemd service file that is used to start the sctipt in the `scripts` folder. This is required to keep the script alive after the user is logged out without having to login as root in a tty just to run the script. It also comes with the bonus of logging the script for debugging.

## So, how do I use this?
First, you need to build an XML file for the VM you want to run. You can use the presets in the `domains` folder as a base and add XML from `domains/qemu-devices` for generic devices and `domains/motherboard` for specific devices. This probably will not be enough for your VM as this project only has XML for devices I own, so you have to manually add code for devices not included here (but you can use mine as a reference).

When the XML is done, define a virtual machine by using:
```
virsh define file.xml
```

Run the install script to copy all files and scripts to the correct places:
```
./install.sh
```

Customize the configuration file at `/etc/lsgp.conf` with the settings you want

Start your virtual machine with the following code, replacing `virtualmachine` with your virtual machine name:
```
sudo systemctl start lsgp@virtualmachine.service
```

When you want to return to the host, just turn off the guest OS.