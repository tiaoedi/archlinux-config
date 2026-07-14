#!/usr/bin/env bash
# ╔═══════════════════════════════════════════════════════════════╗
# ║  Bootstrap AUTOMÁTICO — Fedora Server 44 + Hyprland/Niri        ║
# ║  Replica o setup completo sem interação manual                 ║
# ╚═══════════════════════════════════════════════════════════════╝
# Uso: chmod +x bootstrap.sh && ./bootstrap.sh
#
# Variáveis opcionais (exporta antes de rodar, se quiser customizar):
#   GH_TOKEN=xxx           -> autentica o gh CLI automaticamente
#   AUTO_REBOOT=true       -> reinicia sozinho no final
#   DOTFILES_REPO=usuario/repo -> troca o repositório de dotfiles

set -uo pipefail  # sem -e: passos opcionais não devem travar o script inteiro

DOTFILES_REPO="${DOTFILES_REPO:-tiaoedi/dotfiles-fedora}"
AUTO_REBOOT="${AUTO_REBOOT:-false}"
LOG_FILE="$HOME/bootstrap-$(date +%Y%m%d_%H%M%S).log"

log() { echo "[$(date +%H:%M:%S)] $*" | tee -a "$LOG_FILE"; }
step() { echo "" | tee -a "$LOG_FILE"; echo "═══ $* ═══" | tee -a "$LOG_FILE"; }

step "1. Atualizando sistema"
sudo dnf update -y >> "$LOG_FILE" 2>&1

step "2. Ativando repositórios COPR"
sudo dnf copr enable -y ashbuk/Hyprland-Fedora >> "$LOG_FILE" 2>&1
sudo dnf copr enable -y ctrldemi/ly-dm >> "$LOG_FILE" 2>&1
sudo dnf copr enable -y tofik/nwg-shell >> "$LOG_FILE" 2>&1

step "3. Instalando Hyprland + ecossistema completo"
sudo dnf install -y \
    hyprland hyprlock hypridle \
    xdg-desktop-portal xdg-desktop-portal-hyprland \
    mesa-dri-drivers mesa-vulkan-drivers libva-mesa-driver \
    pipewire pipewire-pulseaudio wireplumber \
    polkit polkit-kde-agent-1 \
    wofi kitty swaybg \
    nautilus wlogout grim slurp wl-clipboard cliphist \
    jetbrains-mono-fonts-all \
    nwg-look \
    ly \
    gnome-keyring \
    network-manager-applet \
    kdeconnectd kde-connect-nautilus \
    git gh jq \
    yazi \
    android-tools \
    qemu-kvm libvirt virt-manager virt-install \
    gtk-murrine-engine sassc bibata-cursor-themes \
    ImageMagick \
    docker-compose \
    >> "$LOG_FILE" 2>&1

step "4. Display manager (ly)"
sudo systemctl enable ly@tty2.service >> "$LOG_FILE" 2>&1
sudo systemctl disable getty@tty2.service >> "$LOG_FILE" 2>&1

step "5. Grupos de virtualização e docker"
sudo systemctl enable --now libvirtd >> "$LOG_FILE" 2>&1
sudo usermod -aG libvirt,kvm,docker "$USER" >> "$LOG_FILE" 2>&1

step "6. Firewall — KDE Connect"
ACTIVE_ZONE=$(sudo firewall-cmd --get-default-zone 2>/dev/null || echo "public")
sudo firewall-cmd --permanent --zone="$ACTIVE_ZONE" --add-port=1714-1764/udp >> "$LOG_FILE" 2>&1
sudo firewall-cmd --permanent --zone="$ACTIVE_ZONE" --add-port=1714-1764/tcp >> "$LOG_FILE" 2>&1
sudo firewall-cmd --reload >> "$LOG_FILE" 2>&1

step "7. Docker instalado + aguarda rede pronta no boot"
if ! command -v docker &> /dev/null; then
    sudo dnf install -y dnf-plugins-core >> "$LOG_FILE" 2>&1
    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo >> "$LOG_FILE" 2>&1
    sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin >> "$LOG_FILE" 2>&1
    sudo systemctl enable --now docker >> "$LOG_FILE" 2>&1
fi
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo tee /etc/systemd/system/docker.service.d/wait-network.conf > /dev/null <<'EOF'
[Unit]
After=network-online.target
Wants=network-online.target
EOF
sudo systemctl enable NetworkManager-wait-online.service >> "$LOG_FILE" 2>&1
sudo systemctl daemon-reload

step "8. VSCodium"
sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg >> "$LOG_FILE" 2>&1
sudo bash -c 'printf "[gitlab.com_paulcarroty_VSCodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\n" > /etc/yum.repos.d/vscodium.repo'
sudo dnf install -y codium >> "$LOG_FILE" 2>&1

step "9. Temas (GTK, ícones, cursor)"
rm -rf /tmp/Orchis-theme /tmp/Tela-icon-theme /tmp/ArcAurora-Cursors
git clone --quiet https://github.com/vinceliuice/Orchis-theme.git /tmp/Orchis-theme >> "$LOG_FILE" 2>&1
(cd /tmp/Orchis-theme && ./install.sh -c dark -t purple --auto 2>/dev/null || ./install.sh -c dark -t purple) >> "$LOG_FILE" 2>&1

git clone --quiet https://github.com/vinceliuice/Tela-icon-theme.git /tmp/Tela-icon-theme >> "$LOG_FILE" 2>&1
(cd /tmp/Tela-icon-theme && ./install.sh -c dark) >> "$LOG_FILE" 2>&1

git clone --quiet https://github.com/yeyushengfan258/ArcAurora-Cursors.git /tmp/ArcAurora-Cursors >> "$LOG_FILE" 2>&1
mkdir -p ~/.icons
cp -r /tmp/ArcAurora-Cursors/dist ~/.icons/ArcAurora-Cursors

step "10. Hyprshot"
rm -rf ~/Hyprshot
git clone --quiet https://github.com/Gustash/Hyprshot.git ~/Hyprshot >> "$LOG_FILE" 2>&1
sudo ln -sf ~/Hyprshot/hyprshot /usr/local/bin/hyprshot
chmod +x ~/Hyprshot/hyprshot

step "11. Oh My Zsh + Oh My Posh (modo não-interativo)"
if [ ! -d ~/.oh-my-zsh ]; then
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended >> "$LOG_FILE" 2>&1
fi
if ! command -v oh-my-posh &> /dev/null; then
    curl -s https://ohmyposh.dev/install.sh | bash -s >> "$LOG_FILE" 2>&1
fi
mkdir -p ~/.poshthemes
rm -rf /tmp/omp-themes-repo
git clone --quiet --depth 1 https://github.com/JanDeDobbeleer/oh-my-posh.git /tmp/omp-themes-repo >> "$LOG_FILE" 2>&1
cp /tmp/omp-themes-repo/themes/*.omp.* ~/.poshthemes/ 2>> "$LOG_FILE"

step "12. Clonando dotfiles e criando symlinks"
rm -rf ~/dotfiles
git clone --quiet "https://github.com/${DOTFILES_REPO}.git" ~/dotfiles >> "$LOG_FILE" 2>&1

mkdir -p ~/.config/hypr ~/.config/niri ~/.config/yazi
[ -f ~/dotfiles/hypr/hyprland.lua ] && ln -sf ~/dotfiles/hypr/hyprland.lua ~/.config/hypr/hyprland.lua
[ -f ~/dotfiles/niri/config.kdl ] && ln -sf ~/dotfiles/niri/config.kdl ~/.config/niri/config.kdl
[ -f ~/dotfiles/yazi/yazi.toml ] && ln -sf ~/dotfiles/yazi/yazi.toml ~/.config/yazi/yazi.toml
[ -f ~/dotfiles/yazi/keymap.toml ] && ln -sf ~/dotfiles/yazi/keymap.toml ~/.config/yazi/keymap.toml
[ -f ~/dotfiles/zsh/.zshrc ] && ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

if [ -d ~/dotfiles/scripts ]; then
    sudo cp ~/dotfiles/scripts/*.sh /usr/local/bin/ 2>> "$LOG_FILE"
    sudo chmod +x /usr/local/bin/*.sh 2>> "$LOG_FILE"
fi
if [ -d ~/dotfiles/systemd ]; then
    sudo cp ~/dotfiles/systemd/*.service ~/dotfiles/systemd/*.timer /etc/systemd/system/ 2>> "$LOG_FILE"
    sudo systemctl daemon-reload
    sudo systemctl enable --now lvm-snapshot.timer 2>> "$LOG_FILE"
fi

step "13. Wallpaper padrão (gerado automaticamente, sem depender de imagem manual)"
mkdir -p ~/Pictures
if [ ! -f ~/Pictures/wallpaper.jpg ]; then
    convert -size 1920x1080 gradient:'#1a1b26'-'#16161e' ~/Pictures/wallpaper.jpg >> "$LOG_FILE" 2>&1
fi

step "14. Recriando serviços Docker (AgentDVR, Pi-hole+Unbound, qBittorrent, FileBrowser)"
sudo mkdir -p /Appdata
sudo chown "$USER:$USER" /Appdata

# --- AgentDVR ---
mkdir -p /Appdata/AgentDVR/config /Appdata/AgentDVR/media/video /Appdata/AgentDVR/media/xml
cat > /Appdata/AgentDVR/docker-compose.yml <<'EOF'
services:
  agentdvr:
    image: doitandbedone/ispyagentdvr:latest
    container_name: agentdvr
    hostname: AgentDVR
    restart: unless-stopped
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
    ports:
      - "8090:8090"
      - "3478:3478/udp"
      - "50000-50010:50000-50010/udp"
    environment:
      - TZ=America/Sao_Paulo
    volumes:
      - /Appdata/AgentDVR/config:/config
      - /Appdata/AgentDVR/media/video:/agent/Media/WebServerRoot/Media
      - /Appdata/AgentDVR/media/xml:/agent/Media/XML
EOF

# --- Pi-hole + Unbound ---
mkdir -p /Appdata/pihole/etc-pihole /Appdata/pihole/etc-dnsmasq.d
cat > /Appdata/pihole/docker-compose.yml <<'EOF'
services:
  pihole:
    container_name: pihole
    hostname: pihole
    image: mpgirro/pihole-unbound:latest
    restart: unless-stopped
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
    environment:
      - TZ=America/Sao_Paulo
      - PIHOLE_DNS_=127.0.0.1#5335
      - DNSSEC=true
    volumes:
      - /Appdata/pihole/etc-pihole:/etc/pihole
      - /Appdata/pihole/etc-dnsmasq.d:/etc/dnsmasq.d
    ports:
      - "53:53/tcp"
      - "53:53/udp"
      - "67:67/udp"
      - "8082:80/tcp"
    cap_add:
      - NET_ADMIN
EOF

# --- qBittorrent + FileBrowser ---
mkdir -p /Appdata/qbittorrent/config /Appdata/qbittorrent/downloads /Appdata/filebrowser/database /Appdata/torrent-stack
cat > /Appdata/torrent-stack/docker-compose.yml <<'EOF'
services:
  qbittorrent:
    image: lscr.io/linuxserver/qbittorrent:latest
    container_name: qbittorrent
    hostname: qBittorrent
    restart: unless-stopped
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Sao_Paulo
      - WEBUI_PORT=8080
    ports:
      - "8080:8080"
      - "6881:6881"
      - "6881:6881/udp"
    volumes:
      - /Appdata/qbittorrent/config:/config
      - /Appdata/qbittorrent/downloads:/downloads

  filebrowser:
    image: filebrowser/filebrowser:latest
    container_name: filebrowser
    hostname: FileBrowser
    restart: unless-stopped
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Sao_Paulo
    ports:
      - "8081:80"
    volumes:
      - /Appdata:/srv
      - /Appdata/filebrowser/database:/database
EOF

log "Serviços Docker criados em /Appdata. Suba com:"
log "  cd /Appdata/AgentDVR && docker compose up -d"
log "  cd /Appdata/pihole && docker compose up -d"
log "  cd /Appdata/torrent-stack && docker compose up -d"

step "15. Autenticação GitHub CLI (automática, se GH_TOKEN estiver definido)"
if [ -n "${GH_TOKEN:-}" ]; then
    echo "$GH_TOKEN" | gh auth login --with-token >> "$LOG_FILE" 2>&1
    log "gh autenticado via GH_TOKEN."
else
    log "GH_TOKEN não definido — pulei autenticação do gh. Rode 'gh auth login' manualmente depois."
fi

step "16. EDITOR padrão"
if ! grep -q "^export EDITOR=" ~/.zshrc 2>/dev/null; then
    echo 'export EDITOR="nvim"' >> ~/.zshrc
fi

step "Concluído"
log "Log completo salvo em: $LOG_FILE"
log ""
log "Ainda pendente de automação (requer conta/licença própria):"
log "  - Genymotion: baixar manualmente em https://www.genymotion.com/download/"
log "  - Noctalia: método de instalação não documentado neste script"
log ""

if [ "$AUTO_REBOOT" = "true" ]; then
    log "AUTO_REBOOT=true — reiniciando em 10 segundos..."
    sleep 10
    sudo systemctl reboot
else
    log "Reinicia quando quiser aplicar tudo: sudo systemctl reboot"
fi
