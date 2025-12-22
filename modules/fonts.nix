{ config, pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      alegreya
      googlesans-code
      quivira
      nerd-fonts.geist-mono
      montserrat
    ];

    # Font configuration
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "DejaVu Serif Condensed" ];
        sansSerif = [ "DejaVu Sans Condensed" ];
        monospace = [ "DejaVu Sans Mono" ];
      };
    };
  };
}
