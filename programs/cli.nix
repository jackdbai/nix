{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    android-tools
    android-udev-rules
    dnsutils
    hugo
    lame
    nettools
    nmap
    steam-run
    yt-dlp
  ];
}
