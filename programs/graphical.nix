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
    lmstudio
    localsend
    obsidian
    orca-slicer
    picard
    postman
    protonmail-desktop
    rpi-imager
    signal-desktop
    teamviewer
    transmission_4-gtk
    vlc
    vscodium
    zed-editor
  ];
}
