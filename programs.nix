{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # CLI
    android-tools
    android-udev-rules
    dnsutils
    docker-compose
    git
    hugo
    lame
    nettools
    nmap
    steam-run
    yt-dlp
    zsh

    # GRAPHICAL
    _1password
    asunder
    brave
    burpsuite
    discord
    element-desktop
    gimp
    github-desktop
    # kitty
    localsend
    mediawriter
    newsflash
    obsidian
    picard
    postman
    rpi-imager
    signal-desktop
    teamviewer
    transmission_4-gtk
    # virtualbox
    vscodium
    vlc

    # HAM
    ardopc
    ax25-apps
    ax25-tools
    chirp
    direwolf
    flamp
    fldigi
    flmsg
    flrig
    flwrap
    gpredict
    gridtracker
    hamlib
    js8call
    pat
    wsjtx
    xastir
    xygrib

    # TEXLIVE
    texliveFull
  ];
}
