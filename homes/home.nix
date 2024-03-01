{ config, pkgs, ... }:

{
  home.username = "jack";
  home.homeDirectory = "/home/jack";

  # Settings for Sway
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
    };
  };

  # Enable significant programs
  programs.gh.enable = true;
  programs.home-manager.enable = true;

  # Bash settings # TODO switch to zsh
  programs.zsh = {
    enable = true;
    shellAliases = {
      # TODO add aliases
      "adblist"="adb shell pm list packages";
      "adblistu"="diff <(adb shell pm list packages) <(adb shell pm list packages -u)";
      "adbreinst"="adb shell cmd package install-existing";
      "adbuninst"="adb shell pm uninstall --user 0";
      "rebuild" = "sudo rm -rf /etc/nixos/* && sudo cp -r /home/jack/git/nix/* /etc/nixos/. && sudo nixos-rebuild switch";
      "upgrade" = "sudo nixos-rebuild switch --upgrade";
    };
  };

  home.stateVersion = "22.11";
}
