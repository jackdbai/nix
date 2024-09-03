{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    _1password
    asunder
    brave
    burpsuite
    discord
    element-desktop
    gimp
    github-desktop
    # kitty
    librewolf
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
