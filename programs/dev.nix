{ config, pkgs, home, ... }:

{
  home.packages = with pkgs; [
    brave
    github-desktop
    kitty
    localsend
    obsidian
    pulsar
    xfce.thunar
  ];
}
