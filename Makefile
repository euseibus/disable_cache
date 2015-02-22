EXTRA_CFLAGS = -m32
obj-m += disableCache.o

all:
        make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules