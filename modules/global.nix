{ config, lib, pkgs, ... }:

### BE SURE TO ADD THIS TO IMPORTS: ../modules/global.nix

{
  programs.hyprland.enable = true;

  # Disable GNOME default applications
  environment.gnome.excludePackages = with pkgs; [
    gnome-calendar
    cheese
    gnome-console
    epiphany
    totem
    yelp
    evince
    geary
    gedit
    seahorse
  ];

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
}
