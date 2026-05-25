{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    android-tools
    brightnessctl
    codex
    dnsutils
    docker-compose
    fdk-aac-encoder
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
    vim
    wget
    xev
    yt-dlp
  ];
}
