{ config, pkgs, inputs, ... }:

{
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
    vscodium
  ];
}
