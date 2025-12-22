{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    android-tools
    brightnessctl
    # android-udev-rules
    claude-code
    cursor-cli
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
    opencode
    steam-run
    wget
    xev
    yt-dlp
  ];
}
