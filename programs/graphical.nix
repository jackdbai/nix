{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    asunder
    brave
    inputs.browseros.packages."${system}".default #BrowserOS
    burpsuite
    freecad
    gimp
    github-desktop
    ghostty
    handbrake
    libreoffice
    lmstudio
    localsend
    obsidian
    orca-slicer
    picard
    postman
    protonmail-desktop
    rpi-imager
    signal-desktop
    sublime3
    teamviewer
    xfce.thunar
    transmission_4-gtk
    vlc
    vscodium
    zed-editor
  ];
}
