mount /dev/sda1 /mnt/gentoo/boot/
mount -t proc /proc/ /mnt/gentoo/proc/
mount -R /dev/ --make-rslave /mnt/gentoo/dev/
mount -R /sys/ --make-rslave /mnt/gentoo/sys/
alias grub-install='grub-install --efi-directory=/boot/'
alias grub-mkconfig='grub-mkconfig -o /boot/grub/grub.cfg'
chroot /mnt/gentoo/
