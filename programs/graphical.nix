{ config, pkgs, home, ... }:

{
  home.packages = with pkgs; [
    asunder
    brave
    # beeper
    discord
    # element-desktop
    # etcher
    gimp
    github-desktop
    # kitty
    localsend
    obsidian
    picard
    # pulsar
    signal-desktop
    # xfce.thunar
    vscodium
    vlc
  ];
}
