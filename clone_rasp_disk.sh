#!/bin/bash
# clone Raspberry Pi system to target disk

target=$1

if [ $target ]; then
    sudo parted $target --script 'mklabel msdos mkpart primary fat32 4194.5kB 541MB mkpart primary ext4 541MB 100% print quit'

    sudo mkfs.vfat -F 32 $target"1"
    sudo mkfs.ext4 -L rootfs $target"2"

    sudo mkdir /mnt/rootfs
    sudo mount $target"2" /mnt/rootfs/
    sudo rsync -axHAWXS --numeric-ids --info=progress2 --exclude={"/mnt/","/boot/firmware/"} /* /mnt/rootfs

    sudo mkdir /mnt/rootfs/mnt /mnt/rootfs/boot/firmware
    sudo mount $target"1" /mnt/rootfs/boot/firmware/
    sudo rsync -axHAWXS --numeric-ids --info=progress2 /boot/firmware/* /mnt/rootfs/boot/firmware/

    uuid1=$(sudo lsblk $target -o PARTUUID | tail -2 | head -1)
    uuid2=$(sudo lsblk $target -o PARTUUID | tail -2 | tail -1)

    sudo sed -i -e "s/PARTUUID=........-01/PARTUUID=$uuid1/g" /mnt/rootfs/etc/fstab
    sudo sed -i -e "s/PARTUUID=........-02/PARTUUID=$uuid2/g" /mnt/rootfs/etc/fstab
    sudo sed -i -e "s/root=PARTUUID=........-02/root=PARTUUID=$uuid2/g" /mnt/rootfs/boot/cmdline.txt
    sudo sed -i -e "s/root=PARTUUID=........-02/root=PARTUUID=$uuid2/g" /mnt/rootfs/boot/firmware/cmdline.txt
else
    echo "Please add target device name of disk, like /dev/sdb."
fi
