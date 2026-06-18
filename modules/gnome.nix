{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Remove xterm
  services.xserver.excludePackages = [
    pkgs.xterm
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Enable gnome keyring
  services.gnome.gnome-keyring.enable = true;
}
