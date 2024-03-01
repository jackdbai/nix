{ config, lib, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    Packages = true;
    extraSpecialArgs = {
      inherit (config.networking) hostName;
    };
    users.jack = {...}: {
      imports = [
        ./home.nix
        ../programs/cli.nix
        ../programs/graphical.nix
        ../programs/texlive.nix
      ];
    };
  };
}
