{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    android-tools
    brightnessctl
    dnsutils
    docker-compose
    fdk-aac-encoder
    gdrive3
    gemini-cli
    git
    hugo
    killall
    lame
    nettools
    nixd
    nmap
    steam-run
    wget
    xev
    yt-dlp
  ];
}
