{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    antigravity
    asunder
    inputs.browseros.packages."${system}".default #BrowserOS
    burpsuite
    freecad
    gimp
    github-desktop
    ghostty
    google-chrome
    handbrake
    libreoffice
    localsend
    # obsidian
    orca-slicer
    picard
    postman
    rpi-imager
    signal-desktop
    sublime3
    teamviewer
    transmission_4-gtk
    vlc
  ];
}
