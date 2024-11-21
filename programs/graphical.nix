{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    asunder
    brave
    burpsuite
    discord
    element-desktop
    firefox-esr
    gimp
    github-desktop
    # handbrake
    # librewolf
    localsend
    makemkv
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
