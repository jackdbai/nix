{ config, pkgs, lib, hostName, eza, ... }:

{
  home.packages = with pkgs; [
    texliveFull
  ];
}
