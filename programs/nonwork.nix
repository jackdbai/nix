{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    _1password-gui
    brave
    element-desktop
    signal-desktop
  ];
}
