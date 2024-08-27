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
  ];
}
