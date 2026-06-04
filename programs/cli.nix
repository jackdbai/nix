{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    android-tools
    brightnessctl
    claude-code
    codex
    dnsutils
    docker-compose
    fdk-aac-encoder
    git
    hugo
    killall
    lame
    nettools
    nixd
    nmap
    #opencode
    steam-run
    vim
    wget
    xev
    yt-dlp
  ];
}
