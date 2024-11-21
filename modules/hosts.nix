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
    127.0.0.1   chaosfem.tw
    127.0.0.1   desktopnexus.com
    127.0.0.1   en.free-wallpapers.su
    127.0.0.1   goodfon.com
    127.0.0.1   hachyderm.io
    127.0.0.1   idposter.com
    127.0.0.1   infosec.exchange
    127.0.0.1   infosec.pub
    127.0.0.1   lemmy.world
    127.0.0.1   mastodon.social
    127.0.0.1   old.reddit.com
    127.0.0.1   peakpx.com
    127.0.0.1   pinterest.com
    127.0.0.1   reddit.com
    127.0.0.1   pic2.me
    127.0.0.1   sh.itjust.works
    127.0.0.1   suwalls.com
    127.0.0.1   tech.lgbt
    127.0.0.1   wall.alphacoders.com
    127.0.0.1   wallapaperflare.com
    127.0.0.1   wallhaven.cc
    127.0.0.1   wallhere.com
    127.0.0.1   wallpaperbetter.com
    127.0.0.1   wallpapers-fenix.eu
    '';
}
