{
  description = "jackdbai";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      "alita" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos/alita
          ./configuration.nix

          home-manager.nixosModules.home-manager
          ({ config, lib, ... }: {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit (config.networking) hostName;
            };
            home-manager.users.jack = {...}: {
              imports = [
                ./home.nix
                ./programs/cli.nix
                # ./programs/darwin.nix
                # ./programs/gaming.nix
                ./programs/graphical.nix
                ./programs/nonwork.nix
                # ./programs/texlive.nix
                # ./programs/work.nix
              ];
            };
          })
        ];
      };
    };
  };
}