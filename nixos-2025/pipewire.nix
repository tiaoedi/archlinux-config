# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# never put virtualbox,mlocate in this list

{
  environment.systemPackages = with pkgs; [
    pipewire_0_2
    pipewire
    pavucontrol
    alsa-utils
    alsa-plugins
    alsa-lib
    alsa-firmware
    ocamlPackages.gstreamer
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-ugly
    volumeicon
    playerctl
    ];
}
