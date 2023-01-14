#!/bin/bash

# Baixa o arquivo de instalação do Gentoo
wget https://gentoo.org/releases/amd64/autobuilds/current-stage3-amd64/stage3-amd64-*.tar.xz

# Descompacta o arquivo de instalação
tar xvf stage3-*.tar.xz -C /mnt/gentoo

# Monta os sistemas de arquivos
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev

# Chroot para o ambiente de instalação
chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) $PS1"

# Configura o sistema de inicialização
emerge-webrsync
emerge --ask sys-kernel/gentoo-sources
emerge --ask sys-apps/pciutils

# Compila e instala o kernel
cd /usr/src/linux
make menuconfig
make -j8 && make install
make modules_install

# Configura o sistema de rede
emerge --ask net-misc/netifrc
echo 'config_eth0="dhcp"' >> /etc/conf.d/net
rc-update add net.eth0 default

# Configura o usuário e senha
useradd -m -G users,wheel -s /bin/bash user
passwd user

# Instala os pacotes desejados
emerge --ask app-editors/nano
emerge --ask net-misc/wget

# Configura o sistema de inicialização
emerge --ask sys-boot/grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# Reinicia o sistema
exit
umount -l /mnt/gentoo/dev{/shm,/pts,}
umount -R /mnt/gentoo
reboot

