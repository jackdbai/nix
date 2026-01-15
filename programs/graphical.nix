{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    antigravity
    asunder
    brave
    inputs.browseros.packages."${system}".default #BrowserOS
    burpsuite
    freecad
    gimp
    github-desktop
    ghostty
    google-chrome
    handbrake
    libreoffice
    lmstudio
    localsend
    nautilus
    # obsidian
    orca-slicer
    picard
    postman
    rpi-imager
    signal-desktop
    sublime3
    system-config-printer
    teamviewer
    transmission_4-gtk
    vlc
    zed-editor
  ];
}
