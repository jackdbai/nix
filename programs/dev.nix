{ config, pkgs, home, ... }:

{
  home.packages = with pkgs; [
    kitty
    xfce.thunar
    xfce.xfce4-whiskermenu-plugin
  ];
}
