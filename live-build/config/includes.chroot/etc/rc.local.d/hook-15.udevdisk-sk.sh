#!/bin/bash

# Configure udev rules for hiding to GNOME the persistence and second system partitions.
# Halt system immediately if the boot USB (Secure-K USB) is removed.
DEV=$(mount | grep persistence | grep mapper | cut -d " " -f 1 | cut -d "/" -f 4)
if [ "$DEV" != "" ]; then
    echo "KERNEL==\"${DEV:0:3}2\",ENV{UDISKS_IGNORE}=\"1\"" > /etc/udev/rules.d/99-hide-disk.rules 
    echo "KERNEL==\"${DEV:0:3}5\",ENV{UDISKS_IGNORE}=\"1\"" >> /etc/udev/rules.d/99-hide-disk.rules 
    echo "KERNEL==\"${DEV:0:3}\",ACTION==\"remove\",SUBSYSTEM==\"block\",RUN+=\"/usr/bin/sdmem -ll\",RUN+=\"/bin/chvt 5\",RUN+=\"/sbin/halt -fpn\"" > /etc/udev/rules.d/99-halt-on-sk-disconnection.rules
fi

# Configure udev rules for hiding every block device.
echo "KERNEL==\"hd*\",ENV{UDISKS_IGNORE}=\"1\"" > /etc/udev/rules.d/99-hide-disk.rules 
echo "KERNEL==\"sd*\",ENV{UDISKS_IGNORE}=\"1\"" >> /etc/udev/rules.d/99-hide-disk.rules 
echo "KERNEL==\"sr*\",ENV{UDISKS_IGNORE}=\"1\"" >> /etc/udev/rules.d/99-hide-disk.rules 
echo "KERNEL==\"sg*\",ENV{UDISKS_IGNORE}=\"1\"" >> /etc/udev/rules.d/99-hide-disk.rules 
echo "KERNEL==\"mmcblk*\",ENV{UDISKS_IGNORE}=\"1\"" >> /etc/udev/rules.d/99-hide-disk.rules 
echo "KERNEL==\"st*\",ENV{UDISKS_IGNORE}=\"1\"" >> /etc/udev/rules.d/99-hide-disk.rules 
echo "KERNEL==\"nst*\",ENV{UDISKS_IGNORE}=\"1\"" >> /etc/udev/rules.d/99-hide-disk.rules 
echo "KERNEL==\"ht*\",ENV{UDISKS_IGNORE}=\"1\"" >> /etc/udev/rules.d/99-hide-disk.rules 
echo "KERNEL==\"nht*\",ENV{UDISKS_IGNORE}=\"1\"" >> /etc/udev/rules.d/99-hide-disk.rules 

/sbin/udevadm control --reload-rules
/sbin/udevadm trigger

exit 0

