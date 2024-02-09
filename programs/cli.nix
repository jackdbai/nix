{ config, pkgs, lib, hostName, eza, ... }:

{
  home.packages = with pkgs; [
    android-tools
    android-udev-rules
    dnsutils
    hugo
    nettools
    nmap
  ];
}
