{ config, pkgs, lib, hostName, eza, ... }:

{
  home.packages = with pkgs; [
    brave
    github-desktop
    kitty
    localsend
    sublime3
  ];
}
