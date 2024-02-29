{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    burpsuite
    firefox-esr
    google-chrome
    notion-app-enhanced
    postman
    slack
    sublime3
  ];
}
