
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
       ./env-vars.nix
      ./desktop-packages.nix
      ./core-packages.nix
      ./virtualbox.nix
      ./polkit.nix
      ./appimages.nix
      ./pipewire.nix
      #./nvidia.nix
      #./desktops/awesome.nix
      #./desktops/i3wm.nix
      ./desktops/bspwm.nix
      #./desktops/hyprland.nix
      ./desktops/dwm.nix
      #./desktops/chadwm.nix                
      #./desktops/qtile.nix
      #./desktops/hlwm.nix               
      #./desktops/openbox.nix
      #./desktops/leftwm.nix
      #./desktops/dusk.nix		          
     #./desktops/wordpress.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sdb";
  boot.loader.grub.useOSProber = true;
  
  
  # Swappiness
    boot.kernel.sysctl = { "vm.swappiness" = 10;};
  
  # Kernel
    #latest
   #boot.kernelPackages = pkgs.linuxPackages_latest;
    #lqx
   #boot.kernelPackages = pkgs.linuxPackages_lqx;
    #xanmod
   #boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
    #testing
   #boot.kernelPackages = pkgs.linuxPackages_testing;
    #zen
   #boot.kernelPackages = pkgs.linuxPackages_zen;

   #thunar
     programs.thunar.enable = true;
      programs.xfconf.enable = true;
      services.gvfs.enable = true;
     services.tumbler.enable = true;

  networking.hostName = "nixos"; 
  
    # Enable networking
  #networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system.
    services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
    #services.xserver.displayManager.lightdm.enable = true;
     #services.xserver.desktopManager.xfce.enable = true;
    services.xserver.displayManager.sddm.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
       
   };

    # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.pc120 = {
       isNormalUser = true;
        description = "pc120";
         extraGroups = [ "mlocate" "networkmanager" "wheel" "samba" "vboxusers" ];
        packages = with pkgs; [
       firefox
      thunderbird
    ];
  };

   programs.bash = {
	  enableCompletion = true;
     shellInit = ''
      . ~/.bashrc-personal
      '';
  };  

# Allow unfree packages
   nixpkgs.config.allowUnfree = true;
   nixpkgs.config.nvidia.acceptLicense = true;

  # List packages installed in system profile. 
    environment.systemPackages = with pkgs; [
    vim 
     neovim
     dropbox
     genymotion
   #  wget
  ];
   
  system.stateVersion = "23.11"; 

  nixpkgs.config.permittedInsecurePackages = [
	"openssl-1.1.1w" "electron-19.1.9"
];

}
