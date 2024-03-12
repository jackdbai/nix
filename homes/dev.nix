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
        ../modules/display/sway.nix
        ../programs/cli.nix
        ../programs/graphical.nix
      ];
    };
  };
}
