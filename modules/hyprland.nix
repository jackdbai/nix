# In case I need to break out Hyprland settings
{ config, pkgs, ... }:

{
  # Enable Hyprland at system level
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common.default = "*";
      hyprland.default = ["hyprland" "gtk"];
    };
  };

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";  # Also helps Electron apps
  };

  # Install Hyprland ecosystem packages
  environment.systemPackages = with pkgs; [
    waybar
    wtype
    wofi
    swww
    grim
    slurp
    wl-clipboard
    xclip
    hyprlock
    hypridle
    hyprpaper
    hyprpicker
    hyprutils
    hyprsunset
    wlsunset
    hyprwayland-scanner
    swaynotificationcenter
    kitty

    # Theming stuff
    nordic
    nordzy-cursor-theme
    zafiro-icons
    papirus-icon-theme
    polkit_gnome
  ];
}
