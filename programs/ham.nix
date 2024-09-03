{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ardopc
    ax25-apps
    ax25-tools
    chirp
    direwolf
    flamp
    fldigi
    flmsg
    flrig
    flwrap
    gpredict
    gridtracker
    hamlib
    js8call
    pat
    wsjtx
    xastir
    xygrib
  ];
}
