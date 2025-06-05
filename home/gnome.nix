{ config, pkgs, lib, inputs, ... }:

{
  # Install GNOME extensions
  home.packages = with pkgs.gnomeExtensions; [
    docker
    paperwm
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
      show-battery-percentage = true;
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/jack/git/nix/notre-dame-de-montreal.jpgg";
      picture-uri-dark = "file:///home/jack/git/nix/notre-dame-de-montreal.jpg";
      picture-options = "zoom";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };
    "org/gnome/shell" = {
      enabled-extensions = [
        "paperwm@paperwm.github.com"
        "native-window-placement@gnome-shell-extensions.gcampax.github.com"
        "docker@stickman_0x00.com"
      ];
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "google-chrome.desktop"
        "cursor.desktop"
        "github-desktop.desktop"
        "signal-desktop.desktop"
        "dev.warp.Warp.desktop"
      ];
    };
    "org/gnome/shell/extensions/paperwm" = {
      show-window-position-bar = false;
      show-workspace-indicator = false;
      show-focus-mode-icon = false;
      show-open-position-icon = false;
      cycle-width-steps = [
        "0.33333333333333333"
        "0.5"
        "0.66666666666666667"
      ];
    };
  };
}