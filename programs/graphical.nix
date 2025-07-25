{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    _1password-gui
    asunder
    burpsuite
    gimp
    github-desktop
    ghostty
    google-chrome
    handbrake
    localsend
    mediawriter
    newsflash
    orca-slicer
    picard
    postman
    protonmail-desktop
    rpi-imager
    signal-desktop
    teamviewer
    transmission_4-gtk
    vlc
    zed-editor
    inputs.zen-browser.packages."${system}".default
  ];
}
