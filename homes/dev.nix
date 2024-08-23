{ config, lib, pkgs, ... }:
{
  home-manager = {

    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit (config.networking) hostName;
    };
    users.jack = {...}: {
      imports = [
        ./home.nix
        # ../modules/display/sway.nix
        ../programs/cli.nix
        ../programs/dev.nix
        ../programs/graphical.nix
        ../programs/ham.nix
      ];


      # GNOME Package Exclusion
      # environment.gnome.excludedPackages = (with pkgs; [
      #   gnome-photos
      #   gnome-tour
      # ]) ++ (with pkgs.gnome; [
      #   cheese
      #   gnome-music
      #   gedit
      #   epiphany
      #   geary
      #   gnome-characters
      #   tali
      #   iagno
      #   hitori
      #   atomix
      #   yelp
      #   gnome-initial-setup
      # ]);

    };
  };
}
