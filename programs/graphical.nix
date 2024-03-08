{ config, pkgs, home, ... }:

{
  home.packages = with pkgs; [
    #_1password-gui
    brave
    discord
    element-desktop
    etcher
    gimp
    github-desktop
    /* kitty */
    localsend
    obsidian
    pulsar
    signal-desktop
  ];
}
