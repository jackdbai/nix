{ config, lib, hosts, ... }:{
  networking.stevenBlackHosts = {
    enable = true;
    blockFakenews = true;
    blockGambling = true;
    blockPorn = true;
    blockSocial = false;
  };
  
  networking.extraHosts = 
    ''
    127.0.0.1   desktopnexus.com
    127.0.0.1   en.free-wallpapers.su
    127.0.0.1   goodfon.com
    127.0.0.1   idposter.com
    127.0.0.1   listal.com
    127.0.0.1   old.reddit.com
    127.0.0.1   pinterest.com
    127.0.0.1   pic2.me
    127.0.0.1   suwalls.com
    127.0.0.1   wall.alphacoders.com
    127.0.0.1   wallapaperflare.com
    127.0.0.1   wallhaven.cc
    127.0.0.1   wallhere.com
    127.0.0.1   wallpaperbetter.com
    127.0.0.1   wallpapers-fenix.eu
    127.0.0.1   wallpics.net
    127.0.0.1   wallspedia.com
    '';
}
