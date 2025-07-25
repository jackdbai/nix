{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # aider-chat-full
    android-tools
    android-udev-rules
    dnsutils
    docker-compose
    fdk-aac-encoder
    git
    hugo
    lame
    nettools
    nixd
    nmap
    steam-run
    wget
    yt-dlp
  ];
}
