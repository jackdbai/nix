{
  description = "jackdbai";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hosts.url = github:StevenBlack/hosts;
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, home-manager, hosts, nixpkgs, ... }: {

    nixosConfigurations = {

      "asahi" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          # ./modules
          ./hostfiles/${host}
          ./roles/stable.nix
          home-manager.nixosModules.home-manager
          (./homes/stable.nix)
          hosts.nixosModule
          (./modules/hosts.nix)
        ];
      };
      
      "dev" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # ./modules
          ./hostfiles/${host}
          ./roles/dev.nix
          home-manager.nixosModules.home-manager
          (./homes/dev.nix)
          hosts.nixosModule
          (./modules/hosts.nix)
        ];
      };

      "ham" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # ./modules
          ./hostfiles/${host}
          ./roles/ham.nix
          home-manager.nixosModules.home-manager
          (./homes/ham.nix)
          hosts.nixosModule
          (./modules/hosts.nix)
        ];
      };

      "server" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # ./modules
          ./hostfiles/${host}
          ./roles/server.nix
          home-manager.nixosModules.home-manager
          (./homes/server.nix)
          hosts.nixosModule
          (./modules/hosts.nix)
        ];
      };

      "stable" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # ./modules
          ./hostfiles/${host}
          ./roles/stable.nix
          home-manager.nixosModules.home-manager
          (./homes/stable.nix)
          hosts.nixosModule
          (./modules/hosts.nix)
        ];
      };
      
    };

  };
}
