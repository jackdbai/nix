{ config, pkgs, lib, inputs, ... }:

{
  # Apple Silicon / Asahi Linux hardware configuration
  hardware.asahi.enable = true;

  # Use systemd-boot EFI boot loader; do not modify EFI variables directly on Apple Silicon
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  # Use iwd backend for Wi-Fi on Apple Silicon (broadcom chips)
  networking.networkmanager.wifi.backend = "iwd";
}
