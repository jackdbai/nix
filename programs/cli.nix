{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    android-tools
    brightnessctl
    codex
    dnsutils
    docker-compose
    fdk-aac-encoder
    gallery-dl
    gdrive3
    gemini-cli
    git
    hugo
    killall
    lame
    nettools
    nixd
    nmap
    opencode
    steam-run
    wget
    xev
    yt-dlp
  ];
}
