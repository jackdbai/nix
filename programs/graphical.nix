{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    asunder
    brave
    inputs.browseros.packages."${system}".default #BrowserOS
    burpsuite
    code-cursor
    freecad
    gimp
    github-desktop
    ghostty
    handbrake
    kitty
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
    transmission_4-gtk
    vlc
    vscodium
    zed-editor
  ];
}
