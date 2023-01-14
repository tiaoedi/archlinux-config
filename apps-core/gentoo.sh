#!/bin/bash

# Formate e monte o disco de destino
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt/gentoo

# Copie os arquivos do LiveCD para o disco de destino
rsync --exclude='/proc/*' --exclude='/sys/*' --exclude='/dev/*' --exclude='/run/*' -a /mnt/livecd/ /mnt/gentoo

# Configure o sistema básico
nano -w /mnt/gentoo/etc/fstab
nano -w /mnt/gentoo/etc/portage/make.conf

# Entre no sistema instalado
chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) $PS1"

# Atualize o sistema
emerge-webrsync
emerge --sync

# Instale o kernel
emerge gentoo-sources
emerge genkernel
genkernel all

# Configure o sistema
nano -w /etc/conf.d/hostname
nano -

