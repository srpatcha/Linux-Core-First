# Linux-Core-First
Learning New Skills BSP or LDD
Steps to follow  module builds:

cd Linux-Device-Drivers/source   // checkout the code with git clone URL

make    //build *KO files

Make clean // helps to clean all files object files.

insmod module_name.ko   // module loads into Kernal module dynamically - lsmod

modinfo  module_name.ko // shows information about the modules 

rmmod module_name       // removes dynamically loaded module and we can also remove static modules using rmmod

modprob static_module_name  // static module can be loaded into Kernal module by using modprob

reding EEPROM 

root@NAE:~# find / -iname eeprom
/usr/sbin/eeprom
/lib/modules/4.8.26/kernel/drivers/misc/eeprom
root@NAE:~# /usr/sbin/eeprom
base-address of eeproms       : 0x50
number of pages to read       : 8 (0x50 .. 0x57)
i2c-devicenode is             : /dev/i2c-0
            on filedescriptor : 3

ioctl(): No such device or address
ioctl returned -1

