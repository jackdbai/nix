{ config, pkgs, lib, system, inputs, ... }:

{
  imports = [
    # Import applications
    # ../programs/androidstudio.nix
    ../programs/cli.nix
    ../programs/graphical.nix
    ../programs/ham.nix
    ../programs/texlive.nix

    # Import GNOME settings
    #./gnome.nix

    # Import dots
    ./dots.nix
  ];

  # wayland.windowManager.hyprland = {
    # enable = true;
    # extraConfig = (import ../modules/hypr {
    #   inherit (config);
    # });
  # };

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
      "build"="nix build --extra-experimental-features 'nix-command flakes'"
      "cleanup"="sudo nix-collect-garbage -d";
      "rebuild" = "sudo nixos-rebuild switch --flake ~/git/nix#main";
      "nvrebuild" = "sudo nixos-rebuild switch --flake ~/git/nix#nvidia";
      "update" = "sudo nix flake update --extra-experimental-features 'nix-command flakes' --flake ~/git/nix";
      "upgrade" = "nix flake update --extra-experimental-features 'nix-command flakes' --flake ~/git/nix && sudo nixos-rebuild switch --flake ~/git/nix#main";
    };
  };

  home.stateVersion = "22.11";
}
