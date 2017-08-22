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
