#!/usr/bin/env bash

set -euo pipefail

LOGFILE="$HOME/fedora-postinstall.log"

exec > >(tee -a "$LOGFILE")
exec 2>&1

clear

echo "======================================"
echo " Fedora 44 Post Install"
echo "======================================"
echo

PACKAGES=(
hyprland
hyprlock
hypridle
hyprland-guiutils
kitty
fuzzel
grim
slurp
cliphist
swaybg
wlogout
xdg-desktop-portal-hyprland
quickshell
noctalia
docker-ce
docker-ce-cli
containerd.io
docker-buildx-plugin
docker-compose-plugin
podman
waydroid
android-tools
brave-browser
google-chrome-stable
firefox
gimp
vlc
mpv
obs-studio
kdenlive
steam
protontricks
telegram-desktop
thunderbird
nextcloud-client
libreoffice-writer
libreoffice-calc
libreoffice-impress
libreoffice-draw
remmina
remmina-plugins-rdp
remmina-plugins-vnc
remmina-plugins-secret
virt-manager
virt-install
virt-viewer
qemu-kvm
libvirt-daemon-kvm
tailscale
cockpit
cockpit-storaged
cockpit-networkmanager
git
neovim
python3-pip
clang
cargo
fastfetch
btop
duf
eza
tree
nvme-cli
smartmontools
gparted
arp-scan
nmap
tcpdump
keepassxc
nwg-look
jetbrains-mono-fonts-all
zsh
bash-completion
)

FLATPAKS=(
com.bitwarden.desktop
io.github.falldaemon.engplayer
io.github.fastrizwaan.WineCharm
ru.yandex.Browser
)

install_rpmfusion() {
    echo
    echo "[+] RPM Fusion"

    sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
}

update_system() {
    echo
    echo "[+] Atualizando sistema"

    sudo dnf upgrade -y
}

install_packages() {
    echo
    echo "[+] Instalando pacotes"

    sudo dnf install -y "${PACKAGES[@]}"
}

install_flatpaks() {

    echo
    echo "[+] Flatpaks"

    flatpak remote-add --if-not-exists flathub \
    https://flathub.org/repo/flathub.flatpakrepo

    for app in "${FLATPAKS[@]}"; do
        flatpak install -y flathub "$app"
    done
}

enable_services() {

    echo
    echo "[+] Serviços"

    sudo systemctl enable --now docker || true
    sudo systemctl enable --now libvirtd || true
    sudo systemctl enable --now tailscaled || true
    sudo systemctl enable --now cockpit.socket || true
}

configure_user() {

    echo
    echo "[+] Grupos"

    sudo usermod -aG docker "$USER" || true
    sudo usermod -aG libvirt "$USER" || true
}

restore_dotfiles() {

    echo
    echo "[+] Dotfiles"

    if [ ! -d "$HOME/.dotfiles" ]; then
        git clone https://github.com/tiaoedi/dotfiles-fedora.git "$HOME/.dotfiles"
    fi
}

menu() {

echo
echo "1) Atualizar sistema"
echo "2) RPM Fusion"
echo "3) Instalar pacotes"
echo "4) Flatpaks"
echo "5) Serviços"
echo "6) Dotfiles"
echo "7) Instalar TUDO"
echo "0) Sair"
echo

read -rp "Escolha: " OP

case "$OP" in
1) update_system ;;
2) install_rpmfusion ;;
3) install_packages ;;
4) install_flatpaks ;;
5) enable_services ;;
6) restore_dotfiles ;;
7)
    update_system
    install_rpmfusion
    install_packages
    install_flatpaks
    enable_services
    configure_user
    restore_dotfiles
    ;;
0) exit 0 ;;
*) echo "Opção inválida" ;;
esac
}

while true; do
    menu
done
