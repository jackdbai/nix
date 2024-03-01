{ config, pkgs, lib, home-manager, ... }:

{
  homebrew = {
    enable = true;
    /* casks = pkgs.callPackage ./casks.nix {}; */
    casks = {
      "brave-browser"
      "github"
      "kitty"
      "obsidian"
      "pulsar"
      "signal"
    };

    # These app IDs are from using the mas CLI app
    # mas = mac app store
    # https://github.com/mas-cli/mas
    #
    # $ nix shell nixpkgs#mas
    # $ mas search <app name>
    #
    #masApps = {
    #  "1password" = 1333542190;
    #  "wireguard" = 1451685025;
    #};
  };

  home.packages = with pkgs; [
    #
  ];
}
