{
  description = "jackdbai";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    browseros.url = "github:jackdbai/browseros-flake";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hosts.url = "github:StevenBlack/hosts";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, browseros, home-manager, hosts, nixpkgs, ... } @ inputs: {

    nixosConfigurations.main = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hostfiles/configuration.nix
        ./modules/global.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jack = import ./home;
          home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
        }
        hosts.nixosModule
        ./modules/hosts.nix
      ];
    };

    nixosConfigurations.nvidia = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hostfiles/configuration.nix
        ./modules/global.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jack = import ./home;
          home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
        }
        hosts.nixosModule
        (./modules/hosts.nix)
        ./modules/nvidia.nix
      ];
    };

  };
}
