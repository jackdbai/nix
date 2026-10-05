{ config, pkgs, lib, inputs, ... }:

{
  programs.vscodium = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        james-yu.latex-workshop
        (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            name = "compline";
            publisher = "rivethorn";
            version = "1.0.1";
            sha256 = "134bm4k2zn7n9qxdq24lzx92yirvam03dxi60bzqdky3vhbccg9i";
          };
        })
      ];
      userSettings = {
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
      };
    };
  };

  home.packages = with pkgs; [
    ### LLM APPLICATIONS ###
    inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".antigravity-cli

    ### CLI APPLICATIONS ###
    android-tools
    brightnessctl
    dnsutils
    docker-compose
    fdk-aac-encoder
    gh
    git
    git-credential-manager
    hugo
    killall
    lame
    nettools
    nixd
    nmap
    vim
    wget
    xev
    yt-dlp

    ### GRAPHICAL APPLICATIONS ###
    asunder
    brave
    burpsuite
    freecad
    gimp
    handbrake
    libreoffice
    obsidian
    orca-slicer
    picard
    postman
    rpi-imager
    teamviewer
    texliveFull
    transmission_4-gtk
    vlc
  ] ++ (lib.optionals pkgs.stdenv.hostPlatform.isx86_64 [
    steam-run
    sublime3
  ]);
}
