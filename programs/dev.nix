{ config, pkgs, home, ... }:

{
  home.packages = with pkgs; [
    kitty
    xfce.thunar
  ];
}
