{ config, pkgs, home, ... }:

{
  home.packages = with pkgs; [
    brave
    discord
    github-desktop
    localsend
    pulsar
  ];
}
