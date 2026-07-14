#!/usr/bin/env bash
# ╔═══════════════════════════════════════════════════════════════╗
# ║  Bootstrap v2 — Fedora Server 44 + Hyprland/Niri                ║
# ║  Saída visível em tempo real + checagem de sucesso/falha        ║
# ╚═══════════════════════════════════════════════════════════════╝
# Uso: chmod +x bootstrap.sh && ./bootstrap.sh
#
# Variáveis opcionais:
#   GH_TOKEN=xxx           -> autentica o gh CLI automaticamente
#   AUTO_REBOOT=true       -> reinicia sozinho no final
#   DOTFILES_REPO=usuario/repo -> troca o repositório de dotfiles

set -uo pipefail

DOTFILES_REPO="${DOTFILES_REPO:-tiaoedi/dotfiles-fedora}"
AUTO_REBOOT="${AUTO_REBOOT:-false}"
LOG_FILE="$HOME/bootstrap-$(date +%Y%m%d_%H%M%S).log"
FAILED_STEPS=()
OK_STEPS=()

# Tudo que passa pelo terminal também vai pro log, em tempo real (tee)
exec > >(tee -a "$LOG_FILE") 2>&1

log()  { echo "[$(date +%H:%M:%S)] $*"; }
step() { echo ""; echo "═══════════════════════════════════════════"; echo "  $*"; echo "═══════════════════════════════════════════"; }

# Roda um comando, mostra saída ao vivo, registra PASS/FAIL sem travar o script
run() {
    local desc="$1"; shift
    log "-> ${desc}"
    if "$@"; then
        OK_STEPS+=("${desc}")
        return 0
    else
        log "FALHOU: ${desc}"
        FAILED_STEPS+=("${desc}")
        return 1
    fi
}

step "0. Verificando conectividade e sudo"
if ! sudo -v; then
    log "ERRO CRÍTICO: sem acesso sudo. Abortando."
    exit 1
fi
if ! ping -c1 -W3 8.8.8.8 &>/dev/null && ! ping -c1 -W3 1.1.1.1 &>/dev/null; then
    log "ERRO CRÍTICO: sem conectividade de rede. Abortando."
    exit 1
fi
log "Sudo e rede OK."

step "1. Atualizando sistema"
run "dnf update" sudo dnf update -y

step "2. Ativando repositórios COPR"
run "copr ashbuk/Hyprland-Fedora" sudo dnf copr enable -y ashbuk/Hyprland-Fedora
run "copr ctrldemi/ly-dm" sudo dnf copr enable -y ctrldemi/ly-dm
run "copr tofik/nwg-shell" sudo dnf copr enable -y tofik/nwg-shell

log "Verificando COPRs ativos..."
dnf copr list 2>/dev/null | grep -E "ashbuk|ctrldemi|tofik" || log "AVISO: nenhum COPR listado como ativo — dnf copr list pode não suportar esse comando nessa versão."

step "3. Instalando Hyprland + ecossistema completo"
PACKAGES=(
    hyprland hyprlock hypridle
    xdg-desktop-portal xdg-desktop-portal-hyprland
    mesa-dri-drivers mesa-vulkan-drivers libva-mesa-driver
    pipewire pipewire-pulseaudio wireplumber
    polkit polkit-kde-agent-1
    wofi kitty swaybg
    nautilus wlogout grim slurp wl-clipboard cliphist
    jetbrains-mono-fonts-all
    nwg-look
    ly
    gnome-keyring
    network-manager-applet
    kdeconnectd kde-connect-nautilus
    git gh jq
    yazi
    android-tools
    qemu-kvm libvirt virt-manager virt-install
    gtk-murrine-engine sassc bibata-cursor-themes
    ImageMagick
    docker-compose
)
run "dnf install pacotes principais" sudo dnf install -y "${PACKAGES[@]}"

log "Conferindo pacotes instalados individualmente..."
MISSING_PKGS=()
for pkg in "${PACKAGES[@]}"; do
    if ! rpm -q "$pkg" &>/dev/null; then
        MISSING_PKGS+=("$pkg")
    fi
done
if [ ${#MISSING_PKGS[@]} -gt 0 ]; then
    log "AVISO: pacotes não confirmados via rpm -q: ${MISSING_PKGS[*]}"
    log "Tentando instalar individualmente os que faltaram..."
    for pkg in "${MISSING_PKGS[@]}"; do
        run "dnf install $pkg" sudo dnf install -y "$pkg"
    done
else
    log "Todos os pacotes principais confirmados instalados."
fi

step "4. Display manager (ly)"
run "enable ly@tty2" sudo systemctl enable ly@tty2.service
run "disable getty@tty2" sudo systemctl disable getty@tty2.service

step "5. Grupos de virtualização e docker"
run "enable libvirtd" sudo systemctl enable --now libvirtd
run "usermod grupos" sudo usermod -aG libvirt,kvm,docker "$USER"

step "6. Firewall — KDE Connect"
ACTIVE_ZONE=$(sudo firewall-cmd --get-default-zone 2>/dev/null || echo "public")
run "firewall udp kdeconnect" sudo firewall-cmd --permanent --zone="$ACTIVE_ZONE" --add-port=1714-1764/udp
run "firewall tcp kdeconnect" sudo firewall-cmd --permanent --zone="$ACTIVE_ZONE" --add-port=1714-1764/tcp
run "firewall reload" sudo firewall-cmd --reload

step "7. Docker instalado + aguarda rede pronta no boot"
if ! command -v docker &> /dev/null; then
    run "docker repo deps" sudo dnf install -y dnf-plugins-core
    run "docker repo add" sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    run "docker install" sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
    run "docker enable" sudo systemctl enable --now docker
else
    log "Docker já instalado, pulando."
fi
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo tee /etc/systemd/system/docker.service.d/wait-network.conf > /dev/null <<'EOF'
[Unit]
After=network-online.target
Wants=network-online.target
EOF
run "enable NM-wait-online" sudo systemctl enable NetworkManager-wait-online.service
sudo systemctl daemon-reload

step "8. VSCodium"
run "vscodium gpg" sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
sudo bash -c 'printf "[gitlab.com_paulcarroty_VSCodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\n" > /etc/yum.repos.d/vscodium.repo'
run "vscodium install" sudo dnf install -y codium

step "9. Temas (GTK, ícones, cursor)"
rm -rf /tmp/Orchis-theme /tmp/Tela-icon-theme /tmp/ArcAurora-Cursors

if run "clone Orchis" git clone --quiet https://github.com/vinceliuice/Orchis-theme.git /tmp/Orchis-theme; then
    cd /tmp/Orchis-theme && git fsck --quiet && cd - >/dev/null
    run "install Orchis" bash -c 'cd /tmp/Orchis-theme && ./install.sh -c dark -t purple'
fi

if run "clone Tela" git clone --quiet https://github.com/vinceliuice/Tela-icon-theme.git /tmp/Tela-icon-theme; then
    cd /tmp/Tela-icon-theme && git fsck --quiet && cd - >/dev/null
    run "install Tela" bash -c 'cd /tmp/Tela-icon-theme && ./install.sh -c dark'
fi

if run "clone ArcAurora" git clone --quiet https://github.com/yeyushengfan258/ArcAurora-Cursors.git /tmp/ArcAurora-Cursors; then
    cd /tmp/ArcAurora-Cursors && git fsck --quiet && cd - >/dev/null
    mkdir -p ~/.icons
    cp -r /tmp/ArcAurora-Cursors/dist ~/.icons/ArcAurora-Cursors
fi

step "10. Hyprshot"
rm -rf ~/Hyprshot
if run "clone Hyprshot" git clone --quiet https://github.com/Gustash/Hyprshot.git ~/Hyprshot; then
    cd ~/Hyprshot && git fsck --quiet && cd - >/dev/null
    sudo ln -sf ~/Hyprshot/hyprshot /usr/local/bin/hyprshot
    chmod +x ~/Hyprshot/hyprshot
fi

step "11. Oh My Zsh + Oh My Posh"
if [ ! -d ~/.oh-my-zsh ]; then
    run "oh-my-zsh install" bash -c 'RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended'
else
    log "oh-my-zsh já instalado, pulando."
fi
if ! command -v oh-my-posh &> /dev/null; then
    run "oh-my-posh install" bash -c 'curl -s https://ohmyposh.dev/install.sh | bash -s'
else
    log "oh-my-posh já instalado, pulando."
fi
mkdir -p ~/.poshthemes
rm -rf /tmp/omp-themes-repo
if run "clone temas oh-my-posh" git clone --quiet --depth 1 https://github.com/JanDeDobbeleer/oh-my-posh.git /tmp/omp-themes-repo; then
    cd /tmp/omp-themes-repo && git fsck --quiet && cd - >/dev/null
    cp /tmp/omp-themes-repo/themes/*.omp.* ~/.poshthemes/ 2>>"$LOG_FILE"
fi

step "12. Clonando dotfiles e criando symlinks"
rm -rf ~/dotfiles
if run "clone dotfiles" git clone --quiet "https://github.com/${DOTFILES_REPO}.git" ~/dotfiles; then
    cd ~/dotfiles
    if git fsck --quiet && git rev-parse HEAD &>/dev/null; then
        log "Integridade do repositório de dotfiles OK: $(git rev-parse --short HEAD)"
    else
        log "AVISO: repositório de dotfiles pode estar corrompido (git fsck falhou)."
        FAILED_STEPS+=("integridade git dotfiles")
    fi
    cd - >/dev/null

    mkdir -p ~/.config/hypr ~/.config/niri ~/.config/yazi
    [ -f ~/dotfiles/hypr/hyprland.lua ] && ln -sf ~/dotfiles/hypr/hyprland.lua ~/.config/hypr/hyprland.lua
    [ -f ~/dotfiles/niri/config.kdl ] && ln -sf ~/dotfiles/niri/config.kdl ~/.config/niri/config.kdl
    [ -f ~/dotfiles/yazi/yazi.toml ] && ln -sf ~/dotfiles/yazi/yazi.toml ~/.config/yazi/yazi.toml
    [ -f ~/dotfiles/yazi/keymap.toml ] && ln -sf ~/dotfiles/yazi/keymap.toml ~/.config/yazi/keymap.toml
    [ -f ~/dotfiles/zsh/.zshrc ] && ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

    if [ -d ~/dotfiles/scripts ]; then
        sudo cp ~/dotfiles/scripts/*.sh /usr/local/bin/ 2>>"$LOG_FILE"
        sudo chmod +x /usr/local/bin/*.sh 2>>"$LOG_FILE"
    fi
    if [ -d ~/dotfiles/systemd ]; then
        sudo cp ~/dotfiles/systemd/*.service ~/dotfiles/systemd/*.timer /etc/systemd/system/ 2>>"$LOG_FILE"
        sudo systemctl daemon-reload
        run "enable lvm-snapshot.timer" sudo systemctl enable --now lvm-snapshot.timer
    fi
fi

step "13. Wallpaper padrão"
mkdir -p ~/Pictures
if [ ! -f ~/Pictures/wallpaper.jpg ]; then
    run "gerar wallpaper" convert -size 1920x1080 gradient:'#1a1b26'-'#16161e' ~/Pictures/wallpaper.jpg
fi

step "14. Recriando serviços Docker (AgentDVR, Pi-hole+Unbound, qBittorrent, FileBrowser)"
sudo mkdir -p /Appdata
sudo chown "$USER:$USER" /Appdata

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

log "Serviços Docker criados em /Appdata."

step "15. Autenticação GitHub CLI"
if [ -n "${GH_TOKEN:-}" ]; then
    if echo "$GH_TOKEN" | gh auth login --with-token; then
        log "gh autenticado via GH_TOKEN."
    else
        FAILED_STEPS+=("gh auth login")
    fi
else
    log "GH_TOKEN não definido — pulei autenticação do gh."
fi

step "16. EDITOR padrão"
if ! grep -q "^export EDITOR=" ~/.zshrc 2>/dev/null; then
    echo 'export EDITOR="nvim"' >> ~/.zshrc
fi

step "RESUMO FINAL"
echo ""
echo "✔ Passos concluídos com sucesso: ${#OK_STEPS[@]}"
for s in "${OK_STEPS[@]}"; do echo "   ✔ $s"; done
echo ""
if [ ${#FAILED_STEPS[@]} -gt 0 ]; then
    echo "✘ Passos que FALHARAM: ${#FAILED_STEPS[@]}"
    for s in "${FAILED_STEPS[@]}"; do echo "   ✘ $s"; done
    echo ""
    echo "Revisa esses itens manualmente. Log completo em: $LOG_FILE"
else
    echo "Nenhuma falha detectada!"
fi
echo ""
echo "Log completo: $LOG_FILE"
echo ""
log "Ainda pendente de automação (requer conta/licença própria):"
log "  - Genymotion: baixar manualmente em https://www.genymotion.com/download/"
log "  - Noctalia: método de instalação não documentado neste script"

if [ "$AUTO_REBOOT" = "true" ]; then
    log "AUTO_REBOOT=true — reiniciando em 10 segundos..."
    sleep 10
    sudo systemctl reboot
else
    log "Reinicia quando quiser aplicar tudo: sudo systemctl reboot"
fi