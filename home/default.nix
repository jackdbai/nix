{ config, pkgs, lib, system, inputs, ... }:

{
  home.username = "jack";
  home.homeDirectory = "/home/jack";

  imports = [
    ./gnome.nix
    ./programs.nix
  ];

  # Enable significant programs
  programs.gh.enable = true;
  programs.home-manager.enable = true;

  #Shell settings
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ll = "ls -l";
      "adblist"="adb shell pm list packages";
      "adblistu"="diff <(adb shell pm list packages) <(adb shell pm list packages -u)";
      "adbreinst"="adb shell cmd package install-existing";
      "adbuninst"="adb shell pm uninstall --user 0";
      "build"="nix build --extra-experimental-features 'nix-command flakes'";
      "cleanup"="sudo nix-collect-garbage -d";
      "dr"="~/Documents/GitHub/nix/rebuild.sh -d";
      "rebuild"="~/Documents/GitHub/nix/rebuild.sh";
      "rmbak"="rm -r ~/.config/*.backup";
      "rr"="rebuild && rmbak";
      "update"="sudo nix flake update --extra-experimental-features 'nix-command flakes' --flake ~/Documents/GitHub/nix";
      "upgrade"="nix flake update --extra-experimental-features 'nix-command flakes' --flake ~/Documents/GitHub/nix && rebuild";
    };
  };

  home.stateVersion = "22.11";
}
