{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    asunder
    burpsuite
    code-cursor
    gimp
    github-desktop
    ghostty
    google-chrome
    handbrake
    localsend
    makemkv
    newsflash
    orca-slicer
    picard
    postman
    rpi-imager
    signal-desktop
    teamviewer
    transmission_4-gtk
    # ungoogled-chromium
    vlc
    # warp-terminal
    zed-editor
    inputs.zen-browser.packages."${system}".default
  ];
}
