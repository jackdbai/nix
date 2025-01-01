{
  description = "jackdbai";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    home-manager = {
      #url = "github:nix-community/home-manager/release-24.05";
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hosts.url = "github:StevenBlack/hosts";
    #nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    solaar.url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz";
  };

  outputs = { self, home-manager, hosts, nixpkgs, solaar, ... }: {

    nixosConfigurations.main = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hostfiles/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jack = import ./home;
        }
        hosts.nixosModule
        (./modules/hosts.nix)
        solaar.nixosModules.default
      ];
    };

    nixosConfigurations.nvidia = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hostfiles/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jack = import ./home;
        }
        hosts.nixosModule
        (./modules/hosts.nix)
        ./modules/nvidia.nix
        solaar.nixosModules.default
      ];
    };

  };
}
