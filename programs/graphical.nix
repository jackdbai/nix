{ config, pkgs, home, ... }:

{
  home.packages = with pkgs; [
    brave
    discord
    element-desktop
    # etcher
    gimp
    github-desktop
    kitty
    localsend
    obsidian
    # pulsar
    signal-desktop
    xfce.thunar
    vscodium
  ];
}
