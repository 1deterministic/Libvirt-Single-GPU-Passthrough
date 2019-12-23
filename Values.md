* `::NAME::` is a name for the virtual machine
* `::UUID::` is an uuid for the virtual machine
* `::RAM::` is the amount of ram the virtual machine will have
* `::THREADS::` is the total number of threads the virtual machine will have, must be equal to `::CORES::` multiplied by `::SMT::`
* `::OVMF::` is the path where the OVMF UEFI firmware file is located
* `::NVRAM::` is the path where the file storing UEFI variables of the virtual machine will be located
* `::CORES::` is the number of cores the virtual machine will have
* `::THREADS::` is the number of threads each core of the virtual machine will have
* `::VROM::` is the path to the graphics card bios file
* `::BOOTLOADER::` is the path to the bootloader used by the virtual machine
* `::MACADDR::` is the mac address that the network device of the virtual machine will have
* `::INTERFACE::` is the name of the host's network interface that the virtual machine's network device will bridge from
* `::ISO::` is the path to an .iso file that will be used as the cdrom of a virtual machine
* `::DISK::` is the path to a block device that will be used as virtual disk by the virtual machine
* `::QCOW2::` is the path to a .qcow2 disk file that will be used as virtual disk by the virtual machine
* `::IMG::` is the path to an .img disk file that will be used as virtual disk by the virtual machine
* `::VENDORID::` is the vendor id of an usb device that will be passed through to the virtual machine
* `::PRODUCTID::` is the product id of an usb device that will be passed through to the virtual machine
* `::PORTNUMBER::` is the internal usb port number that the 'per-device' usb passthrough will have on the virtual usb controller, each device must have a different number and they should start at 1