{ config, pkgs, inputs, ... }:

{
  programs.vscodium = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
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
    steam-run
    vim
    wget
    xev
    yt-dlp

    ### GRAPHICAL APPLICATIONS ###
    asunder
    brave
    inputs.browseros.packages."${pkgs.stdenv.hostPlatform.system}".default #BrowserOS
    burpsuite
    freecad
    gimp
    google-chrome
    handbrake
    libreoffice
    obsidian
    orca-slicer
    picard
    postman
    rpi-imager
    sublime3
    teamviewer
    texlivePackages.scheme-full
    transmission_4-gtk
    vlc
  ];
}
