{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    android-tools
    # android-udev-rules
    claude-code
    cursor-cli
    dnsutils
    docker-compose
    fdk-aac-encoder
    git
    hugo
    lame
    nettools
    nixd
    nmap
    opencode
    steam-run
    wget
    yt-dlp
  ];
}
