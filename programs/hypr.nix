{ config, pkgs, home, ... }:

{
  home.packages = with pkgs; [
    wofi
  ];
}
