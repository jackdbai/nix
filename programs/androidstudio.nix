{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    android-studio-full
  ];
}
