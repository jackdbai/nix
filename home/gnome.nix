{ config, pkgs, lib, inputs, ... }:

{
  # Install GNOME extensions
  home.packages = with pkgs; [
    gnomeExtensions.docker
  ];

  # dconf settings that I usually change immediately on installing a GNOME DE
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
      power-button-action = "nothing";
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = false;
      click-method = "'fingers'";
    };
    "org/gnome/desktop/session" = {
      idle-delay = "uint32 0";
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/jack/git/nix/StIsidore.jpg";
      picture-uri-dark = "file:///home/jack/git/nix/StIsidore.jpg";
      picture-options = "centered";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };
    "org/gnome/shell" = {
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "brave-browser.desktop"
        "org.gnome.Calendar.desktop"
        "discord.desktop"
        "github-desktop.desktop"
        # "librewolf.desktop"
        "obsidian.desktop"
        "codium.desktop"
        "org.gnome.Console.desktop"
      ];
    };
  };
}