CONFIG_MODULE_SIG=n
CONFIG_MODULE_SIG_ALL=n

KDIR  := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
MAKE :=make
obj-m+=hello_world_dd.o
obj-m+=simple_driver_mutex.o

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
