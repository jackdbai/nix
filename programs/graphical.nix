{ config, pkgs, home, ... }:

{
  home.packages = with pkgs; [
    asunder
    brave
    burpsuite
    discord
    element-desktop
    gimp
    github-desktop
    # kitty
    localsend
    mediawriter
    obsidian
    picard
    postman
    rpi-imager
    signal-desktop
    # xfce.thunar
    vscodium
    vlc
  ];
}
