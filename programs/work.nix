{ config, pkgs, lib, home-manager, ... }:

{
  homebrew = {
    enable = true;
    /* casks = pkgs.callPackage ./casks.nix {}; */
    casks = {
      "burp-suite"
      "firefox-esr"
      "github"
      "google-chrome"
      "kitty"
      "notion"
      "obsidian"
      "postman"
      "pulsar"
      "slack"
      "sublime-text"
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
