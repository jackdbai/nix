{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    antigravity-fhs
    asunder
    blender
    inputs.browseros.packages."${system}".default
    burpsuite
    gimp
    github-desktop
    google-chrome
    ghostty
    handbrake
    localsend
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
