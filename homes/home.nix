{ config, pkgs, ... }:

{
  # home.username = "jack";
  # home.homeDirectory = "/home/jack";

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
