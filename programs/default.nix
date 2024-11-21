{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    github-desktop
    librewolf
    vscodium
  ];
}
