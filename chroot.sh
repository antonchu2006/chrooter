#!/bin/bash

lsblk

echo 
echo
echo
echo "[+] In what disk you want to make chroot?"
read disk
echo "[+] Number of the root partition"
read root_partition
echo "[+] Number of the /boot partition"
read boot_partition
echo
mkdir /mnt/chrooter


mount $disk$root_partition /mnt/chrooter

mount $disk$boot_partition /mnt/chrooter/boot 


mount --types proc /proc /mnt/chrooter/proc
mount --rbind /sys /mnt/chrooter/sys
mount --make-rslave /mnt/chrooter/sys 
mount --rbind /dev /mnt/chrooter/dev
mount --make-rslave /mnt/chrooter/dev

echo
echo
echo
echo "[*] Chroot completed successfully in the directory /mnt/chrooter"
echo "Type the command 'source /etc/profile'"

chroot /mnt/chrooter /bin/bash

