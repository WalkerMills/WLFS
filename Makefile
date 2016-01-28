obj-m := wlfs.o
wlfs-objs := init.o super.o util.o

KDIR := /lib/modules/$(shell uname -r)

all: ko mkfs-wlfs

clean:
	$(MAKE) -C $(KDIR)/build M=$(PWD) clean
	$(RM) mkfs-wlfs

ko:
	$(MAKE) -C $(KDIR)/build M=$(PWD) modules

# mkfs-wlfs: private CFLAGS = -g
mkfs-wlfs: util.o
mkfs-wlfs_SOURCES:
	mkfs-wlfs.c wlfs.h disk.h
