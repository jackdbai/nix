{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    ### CLI APPLICATIONS ###
    # android-tools
    # antigravity-cli
    brightnessctl
    claude-code
    #codex
    dnsutils
    docker-compose
    #fdk-aac-encoder
    gh
    git
    git-credential-manager
    #hugo
    killall
    #lame
    nettools
    nixd
    nmap
    #opencode
    steam-run
    vim
    wget
    xev
    #yt-dlp

    ### GRAPHICAL APPLICATIONS ###
    #asunder
    brave
    # inputs.browseros.packages."${pkgs.system}".default #BrowserOS
    #burpsuite
    #freecad
    #gimp
    # github-desktop
    # ghostty
    google-chrome
    #handbrake
    #libreoffice
    #localsend
    obsidian
    #orca-slicer
    #picard
    #postman
    rpi-imager
    # signal-desktop
    sublime3
    #teamviewer
    #transmission_4-gtk
    #vlc
    #vscodium
    zed-editor
  ];
}
