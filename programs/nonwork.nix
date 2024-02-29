{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    #_1password-gui
    element-desktop
    kitty
    obsidian
    signal-desktop
  ];
}
