{ config, lib, pkgs, ... }:

### BE SURE TO ADD THIS TO IMPORTS: ../modules/global.nix

{
  # Disable GNOME default applications
  environment.gnome.excludePackages = with pkgs; [
    cheese
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
}