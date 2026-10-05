# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Basic nixos-apple-silicon support and bootloader settings
  hardware.asahi.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  boot.initrd.luks.devices = {
    "cryptroot" = {
      device = "/dev/disk/by-uuid/cd9edb30-9cb1-440f-b433-7bd94a24c8e2";
      allowDiscards = true;
    };
  };

  networking.hostName = "petrus"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jack = {
    isNormalUser = true;
    description = "Jack";
    extraGroups = [ "networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      brave
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "26.11"; # Did you read the comment?
}
