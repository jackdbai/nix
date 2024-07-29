{ config, lib, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit (config.networking) hostName;
    };
    users.jack = {...}: {
      imports = [
        ./home.nix
        ../programs/cli.nix
        ../programs/graphical.nix
        # ../programs/ham.nix
        ../programs/texlive.nix
      ];
    };
  };
}
