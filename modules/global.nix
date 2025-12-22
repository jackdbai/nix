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

  # temp enable gnome keyring
  services.gnome.gnome-keyring.enable = true;

  # Remove xterm
  services.xserver.excludePackages = [
    pkgs.xterm
  ];

  # Enable ADB
  programs.adb.enable = true;

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
  networking.wireless.iwd.enable = true;

  # Enable power manager
  services.upower.enable = true;

}
