{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    asunder
    brave
    burpsuite
    gimp
    github-desktop
    ghostty
    handbrake
    localsend
    mediawriter
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
    inputs.zen-browser.packages."${system}".default
  ];
}
