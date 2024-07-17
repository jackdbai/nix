{ config, pkgs, home, ... }:

{
  home.packages = with pkgs; [
    asunder
    brave
    burpsuite
    discord
    element-desktop
    gimp
    github-desktop
    localsend
    mediawriter
    newsflash
    obsidian
    picard
    postman
    rpi-imager
    signal-desktop
    teamviewer
    transmission-gtk
    # virtualbox
    vscodium
    vlc
  ];
}
