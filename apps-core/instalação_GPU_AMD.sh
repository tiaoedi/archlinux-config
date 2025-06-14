#!/bin/bash

########################################################################
#    Autor = Rodrigo (Rbgames Linux)                                   #
#    Tecnico em TI, tecnico em redes e finalizando tecnologo em Redes  #
#    E-mail = rbgameslinux@gmail.com                                   #
########################################################################


# Variaveis
Note='[\033[1;34mNOTA\033[0m]'
Error='[\033[1;31mERRO\033[0m]'
usuario=$(whoami)
package_amd=(lib32-vulkan-radeon amd-ucode xf86-video-amdgpu xf86-video-ati vulkan-radeon)
#package_intel=(vulkan-intel intel-ucode libva-intel-driver xf86-video-intel lib32-vulkan-intel)
package_yay=(swayosd-git waypaper qt5ct-kde qt6ct-kde grimblast swaylock-effects reiserfsprogs wlogout protonup-qt-bin clipman clipse heroic-games-launcher-bin visual-studio-code-bin)   
package_arch=(base-devel xorg-xhost git wget unzip genymotion bash-completion fish gum rofi wofi unrar okular waybar swww dolphin dolphin-plugins ark firefox pamac loupe xdg-desktop-portal xdg-desktop-portal-gnome xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland blueman bluedevil xdg-desktop-portal-wlr xdg-user-dirs xdg-user-dirs-gtk xdg-utils archlinux-xdg-menu btop ttf-font-awesome noto-fonts noto-fonts-emoji
    noto-fonts-extra ttf-firacode-nerd ttf-jetbrains-mono-nerd swayidle polkit-gnome bash-completion ntfs-3g ffmpegthumbnailer ffmpegthumbs volumeicon pavucontrol pamixer notification-daemon 
    wl-clipboard wayland-utils clinfo alsa-utils  imagemagick adw-gtk-theme breeze breeze5 breeze-gtk breeze-icons nwg-look bluez bluez-utils bluez-tools kio kde-cli-tools sddm xorg
    network-manager-applet exfat-utils btrfs-progs xfsprogs jfsutils f2fs-tools nilfs-utils udftools e2fsprogs kitty gedit libva fastfetch mangohud telegram-desktop discord wine filelight
    pacman-contrib wine-gecko wine-mono winetricks curl vulkan-tools vulkan-icd-loader lib32-vulkan-icd-loader lib32-mesa lm_sensors mesa-demos xorg-xdpyinfo mesa-utils glfw mesa llvm lib32-llvm
    lvm2 zip timeshift lutris linux-lts-headers linux-zen-headers steam gimp antimicrox celluloid mpv vlc android-tools hyprutils hyprland-qtutils qt6-5compat qt6-declarative qt6-svg
    gnome-disk-utility gnome-calendar gnome-calculator ksnip swaync hyprland xorg-server xorg-xinit epapirus-icon-theme)


    # Exibir "leia-me"


clear

echo -e "
===============================
      LEIA-ME ANTES DE USAR     
===============================
#########################################################
# Autor = Rodrigo (Rbgames Linux)                       #
# E-mail = rbgameslinux@gmail.com                       #
#########################################################

Este script foi feito para Archlinux com placas de video AMD.
Este script fará alterações no seu sistema.
Irá adicionar suporte ao aur via yay e instalará pacotes do aur.
Ele instalará pacotes e irá adicionar o usuário ao grupo 'wheel'.
Lembrando que ele foi feito para instalações minimal do archlinux.
ATENCÃO SÓ GPU AMD !!!
Utilize por sua conta e risco
Tem certeza de que deseja prosseguir.

Se você não concorda, digite 'não' ou 'n'.
Se concorda, digite 'sim' ou 's' para continuar."


 # confirmação do usuário
read -p "Você concorda em continuar? (sim/não): " resposta

    # Converter para minúsculas 
resposta=$(echo "$resposta" | tr '[:upper:]' '[:lower:]')

    # Verificar a resposta
if [[ "$resposta" == "sim" || "$resposta" == "s" ]]; then
echo "Você concordou! Continuando..."

clear

echo -e "\033[1;34m"
echo "\`7MM\"\"\"Mq.  \`7MM\"\"\"Yp,       .g8\"\"\"bgd                                             ";
echo "  MM   \`MM.   MM     Yb    .dP'     \`M                                                      ";
echo "  MM   ,M9    MM     dP    dM'       \`   ,6\"Yb.  \`7MMpMMMb.pMMMb.   .gP\"Ya  ,pP\"Ybd      ";
echo "  MMmmdM9     MM\"\"\"bg.     MM           8)   MM    MM    MM    MM  ,M'   Yb 8I   \`\"      ";
echo "  MM  YM.     MM     \`Y    MM.    \`7MMF' ,pm9MM    MM    MM    MM  8M\"\"\"\"\"\" \`YMMMa.  ";
echo "  MM   \`Mb.   MM     ,9    \`Mb.     MM  8M   MM    MM    MM    MM  YM.    , L.   I8         ";
echo ".JMML. .JMM..JMMmmmd9        \`\"bmmmdPY  \`Moo9^Yo..JMML  JMML  JMML. \`Mbmmd' M9mmmP'       ";
echo -e "\033[0m\n"

    # Detecta a fabricante do CPU e insere o pacote de microcode adequado à lista de pacotes (x86mota)
cpu=$(grep -m 1 'vendor_id' /proc/cpuinfo | awk '{print $NF}')
case "${cpu}" in
  AuthenticAMD)
    pacotes+=("${package_amd[@]}")
    ;;
  GenuineIntel)
    pacotes+=("${package_intel[@]}")
    ;;
  *) exit 0 ;;
esac

# Habilita o repositório multilib
PacmanPath="/etc/pacman.conf"
MultilibMsg="Habilitando repositório multilib"
grep -q '^#\[multilib\]' "${PacmanPath}" && {
  echo -e "${Note} - ${MultilibMsg}"
  sudo sed -i '/^#\[multilib\]/{s/^#//;n;s/^#//;}' "${PacmanPath}" && {
    echo -e "${Clear}${OK} - ${MultilibMsg}"
  } || echo -e "${Clear}${Error} - ${MultilibMsg}"
}   
   
    # instalação de pacotes

sudo pacman -Syu --noconfirm --needed
cd $HOME/pos_install_hyprland
sudo pacman -U --noconfirm --needed qqc2-desktop-style5-5.116.1-1-x86_64.pkg.tar.zst 

echo "Instalando pacotes necessarios do systema com pacman"



Install_pacman() {
    package_arch=$1
    for i in {1..3}; do
        if sudo pacman -S --noconfirm --needed "$package_arch"; then
            echo "$package_arch instalado com sucesso."
            break
        else
            echo "Erro ao instalar $package_arch. Tentativa $i de 3..."
            read -p "Pressione qualquer tecla para continuar..."
        fi
    done
}

for pkg in "${package_arch[@]}"; do
    Install_pacman "$pkg"
done



    #instalar o yay p/ter suporte ao aur.

echo "Instalando o suporte ao aur-helper com yay"

cd $HOME/
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si --noconfirm
    cd $HOME/

rm -fr yay-bin

    #Instalar pacotes do aur com yay 

echo "Instalando pacotes necessarios do aur"


install_yay() {
    package_yay=$1
    for i in {1..3}; do
        if yay -S --noconfirm --needed "$package_yay"; then
            echo "$package_yay instalado com sucesso."
            break
        else
            echo "Erro ao instalar $package_yay. Tentativa $i de 3..."
            read -p "Pressione qualquer tecla para continuar..."
        fi
    done
}
          
for pkg in "${package_yay[@]}"; do
    install_yay "$pkg"
done

     # Adiciona o usuário ao grupo 'wheel'

 echo "Adicionando usuário ao grupo 'wheel'"
 sudo usermod -aG wheel "$usuario"
 sudo usermod -aG lp "$usuario"

     #cria pastas de usuario no dolphin
        
    xdg-user-dirs-update 

     #coloca o dolphin com padrão do sistema

echo "Colocando o dolphin com padrão do sistema"

    xdg-mime default org.kde.dolphin.desktop inode/directoryxdg-mime default org.kde.dolphin.desktop inode/directory 

    #Habilita o sddm 

echo "Habilitando o sddm, bluetooth no sitema"

    systemctl enable sddm.service ; sudo systemctl start bluetooth.service ; sudo systemctl enable bluetooth.service

    #dofiles

echo "Extraindo configurações nas suas devidas pastas"    

cd $HOME/pos_install_hyprland

if [ -f "$(pwd)/configs.tar.gz" ]; then
    tar -xzvf "$(pwd)/configs.tar.gz" -C "$HOME/"
    echo "Arquivo configs.tar.gz extraído para ~/configs com sucesso."
else
    echo "configs.tar.gz não encontrado no diretório atual."
fi  

echo "Copiando p/.config"
cp -r $HOME/configs/* ~/.config  
rm -fr $HOME/configs
 
if [ -f "$(pwd)/simple-sddm-2.tar.gz" ]; then
    sudo tar -xzvf "$(pwd)/simple-sddm-2.tar.gz" -C "/usr/share/sddm/themes/"
    echo "Arquivo simple-sddm-2.tar.gz extraído para /usr/share/sddm/themes/ com sucesso."
else
    echo "simple-sddm-2.tar.gz não encontrado no diretório atual."
fi

if [ -f "$(pwd)/sddm.conf.tar.gz" ]; then
    sudo tar -xzvf "$(pwd)/sddm.conf.tar.gz" -C "/etc/"
    echo "Arquivo sddm.conf.tar.gz extraído para /etc/ com sucesso."
else
    echo "sddm.conf.tar.gz não encontrado no diretório atual."
fi 

echo "Descompactação finalizada com sucesso"
sleep 1
cd $HOME/
echo "Removendo os arquivos baixados"
sleep 1
rm -fr pos_install_hyprland

echo -e "
Vamos reiniciar a sua maquina e após isso estára pronta para uso
Reiniciando
Pressione Enter para reiniciar, ou CTRL+C para cancelar."
read -p ""
sudo reboot

###################final do script #########################

else
    # Caso o usuário digite algo diferente
    echo "Resposta inválida! Por favor, digite 's' ou 'n'."
fi
 
else
  echo "Você não concordou. O script será encerrado."
  exit 1
fi
