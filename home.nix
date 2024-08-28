{ config, pkgs, ... }:

{

  imports = [
    ./programs.nix
  ];

  ### dconf settings that I usually change immediately on installing a GNOME DE
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
      picture-uri = "file:///home/jack/git/nix/StJerome.jpg";
      picture-uri-dark = "file:///home/jack/git/nix/StJerome.jpg";
      picture-options = "zoom";
    };
    "org/gnome/shell" = {
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "brave-browser.desktop"
        "org.gnome.Calendar.desktop"
        "discord.desktop"
        "github-desktop.desktop"
        "obsidian.desktop"
        "codium.desktop"
        "org.gnome.Console.desktop"
      ];
    };
  };

  # Enable significant programs
  programs.gh.enable = true;
  programs.home-manager.enable = true;

  # Shell settings #
  programs.zsh = {
    enable = true;
    shellAliases = {
      # TODO add aliases
      "adblist"="adb shell pm list packages";
      "adblistu"="diff <(adb shell pm list packages) <(adb shell pm list packages -u)";
      "adbreinst"="adb shell cmd package install-existing";
      "adbuninst"="adb shell pm uninstall --user 0";
      "cleanup"="sudo nix-collect-garbage -d";
      "rebuild-asahi" = "sudo nixos-rebuild switch --flake ~/git/nixasahi";
      "rebuild-dev" = "sudo nixos-rebuild switch --flake ~/git/nixdev";
      "rebuild-ham" = "sudo nixos-rebuild switch --flake ~/git/nixham";
      "rebuild-server" = "sudo nixos-rebuild switch --flake ~/git/nixserver";
      "rebuild-stable" = "sudo nixos-rebuild switch --flake ~/git/nixstable";
    };
  };

  home.stateVersion = "22.11";
}
