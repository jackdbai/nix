{ config, lib, pkgs, ... }:

### BE SURE TO ADD THIS TO IMPORTS: ../modules/global.nix

{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./hyprland.nix
    ./networking.nix
  ];
  # Disable GNOME default applications
  #environment.gnome.excludePackages = with pkgs; [
  #  gnome-calendar
  #  cheese
  #  gnome-console
  #  epiphany
  #  totem
  #  yelp
  #  evince
  #  geary
  #  gedit
  #  seahorse
  #];

  environment.systemPackages = with pkgs; [
    catppuccin-sddm
    sddm-astronaut
  ];

  # Enable SDDM
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha-mauve";
  };

  # temp enable gnome keyring
  services.gnome.gnome-keyring.enable = true;

  # Remove xterm
  services.xserver.excludePackages = [
    pkgs.xterm
  ];

  # Enable ADB
  # programs.adb.enable = true;

  # Enable Docker
  virtualisation.docker.enable = true;

  # Accept Android SDK EULA
  nixpkgs.config.android_sdk.accept_license = true;

  # Enable ZSH
  programs.zsh.enable = true;
  users.users.jack = {
    shell = pkgs.zsh;
  };

  # Enable auto-login
  # services.getty.autologinUser = "jack";

  # Enable waybar?
  programs.waybar.enable = true;

  # Enable iwd
  # networking.wireless.iwd.enable = true;

  # Enable power manager
  services.upower.enable = true;

  # Enable drive mounting
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Enable printing
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
