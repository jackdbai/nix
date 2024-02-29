{
  description = "jackdbai";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
     "alita" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/alita
          ./roles/workstation.nix

          home-manager.nixosModules.home-manager
          ({ config, lib, ... }: {
            home-manager = {
              useGlobalPkgs = true;
              Packages = true;
              extraSpecialArgs = {
                inherit (config.networking) hostName;
              };
              users.jack = {...}: {
                imports = [
                  ./home.nix
                  ./programs/cli.nix
                  ./programs/graphical.nix
                  ./programs/nonwork.nix
                  ./programs/texlive.nix
                ];
              };
            };
          })
        ];
      };
      "elle" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/elle
          ./roles/hypertop.nix

          home-manager.nixosModules.home-manager
          ({ config, lib, ... }: {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit (config.networking) hostName;
              };
              users.jack = {...}: {
                imports = [
                  ./home.nix
                  ./programs/cli.nix
                  ./programs/graphical.nix
                  ./programs/nonwork.nix
                ];
              };
            };
          })
        ];
      };
    };
  };
}
