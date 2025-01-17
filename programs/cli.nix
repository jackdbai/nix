{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    android-tools
    android-udev-rules
    dnsutils
    docker-compose
    fdk-aac-encoder
    git
    hugo
    lame
    nettools
    nmap
    steam-run
    wget
    yt-dlp
  ];
}
