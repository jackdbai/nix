{ config, pkgs, lib, system, inputs, ... }:

let
  settings = import ../hostfiles/build-settings.nix;
in
{
  home.username = "jack";
  home.homeDirectory = "/home/jack";

  imports = [
    ../programs/cli.nix
  ] ++ lib.optional (settings.ham.enable or false) ../programs/ham.nix
    ++ lib.optional (settings.texlive.enable or false) ../programs/texlive.nix
    ++ lib.optional (settings.androidstudio.enable or false) ../programs/androidstudio.nix;

  # Enable significant programs
  programs.gh.enable = true;
  programs.home-manager.enable = true;

  #ZSH settings
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      "adblist"="adb shell pm list packages";
      "adblistu"="diff <(adb shell pm list packages) <(adb shell pm list packages -u)";
      "adbreinst"="adb shell cmd package install-existing";
      "adbuninst"="adb shell pm uninstall --user 0";
      "build"="nix build --extra-experimental-features 'nix-command flakes'";
      "cleanup"="sudo nix-collect-garbage -d";
      "nvrebuild"="sudo nixos-rebuild switch --flake ~/Documents/GitHub/nix#nvidia";
      "rebuild"="~/Documents/GitHub/nix/build.sh";
      "rmbak"="rm -r ~/.config/*.backup";
      "rr"="rebuild && rmbak";
      "update"="sudo nix flake update --extra-experimental-features 'nix-command flakes' --flake ~/Documents/GitHub/nix";
      "upgrade"="nix flake update --extra-experimental-features 'nix-command flakes' --flake ~/Documents/GitHub/nix && ~/Documents/GitHub/nix/build.sh";
    };
  };

  home.stateVersion = "22.11";
}
