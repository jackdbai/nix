{ config, pkgs, home, ... }:

{
  home.packages = with pkgs; [
    brave
    github-desktop
    kitty
    localsend
    obsidian
    pulsar
    sublime4
    xfce.thunar
    vscodium
  ];
}
