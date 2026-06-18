{ config, pkgs, inputs, ... }:

{
  imports = [
    ./fonts.nix
    ./hyprland.nix
  ];

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

  # Enable printing
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable SDDM
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha-mauve";
  };

  # Graphical system packages
  environment.systemPackages = with pkgs; [
    catppuccin-sddm
    sddm-astronaut
    networkmanagerapplet
    nmgui
  ];

  # Enable waybar
  programs.waybar.enable = true;

  # Enable gnome keyring
  services.gnome.gnome-keyring.enable = true;
}
