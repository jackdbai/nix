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
    # librewolf
    localsend
    mediawriter
    newsflash
    obsidian
    orca-slicer
    picard
    postman
    rpi-imager
    signal-desktop
    teamviewer
    transmission_4-gtk
    # virtualbox # Takes too long to build tbh
    vscodium
    vlc
  ];
}
