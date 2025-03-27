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
    google-chrome
    handbrake
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
    protonmail-desktop
    vscodium
    vlc
  ];
}
