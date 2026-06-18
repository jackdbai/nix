{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./networking.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable Docker
  virtualisation.docker.enable = true;

  # Accept Android SDK EULA
  nixpkgs.config.android_sdk.accept_license = true;

  # Enable ZSH
  programs.zsh.enable = true;
  users.users.jack = {
    shell = pkgs.zsh;
  };

  # Enable power manager
  services.upower.enable = true;

  # Enable drive mounting
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
