{ config, pkgs, lib, system, inputs, ... }:

{
  imports = [
    # Import applications
    ../programs/cli.nix
    ../programs/graphical.nix
    ../programs/ham.nix
    ../programs/texlive.nix

    # Import Flatpaks
    # ../modules/flatpaks.nix

    # Import GNOME settings
    ./gnome.nix
  ];

  # Enable significant programs
  programs.gh.enable = true;
  programs.home-manager.enable = true;

  # Shell settings
  programs.bash = {
    enable = true;
    shellAliases = {
      "adblist"="adb shell pm list packages";
      "adblistu"="diff <(adb shell pm list packages) <(adb shell pm list packages -u)";
      "adbreinst"="adb shell cmd package install-existing";
      "adbuninst"="adb shell pm uninstall --user 0";
      "cleanup"="sudo nix-collect-garbage -d";
      "rebuild" = "sudo nixos-rebuild switch --flake ~/git/nix#main";
      "nvrebuild" = "sudo nixos-rebuild switch --flake ~/git/nix#nvidia";
      "update" = "sudo nix flake update --extra-experimental-features 'nix-command flakes' --flake ~/git/nix";
      "upgrade" = "nix flake update --extra-experimental-features 'nix-command flakes' --flake ~/git/nix && sudo nixos-rebuild switch --flake ~/git/nix#main";
    };
  };

  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
  ];

  home.stateVersion = "22.11";
}
