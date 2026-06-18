{
  description = "jackdbai";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    browseros.url = "github:jackdbai/browseros-flake";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      # url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hosts.url = "github:StevenBlack/hosts";
    nixpkgs.url = "github:nixos/nixpkgs/master";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
  };

  outputs = { self, browseros, home-manager, hosts, nixpkgs, ... } @ inputs: {

    nixosConfigurations.tui = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hostfiles/active/configuration.nix
        ./modules/global.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jack = {
            imports = [
              ./home
            ];
          };
          home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
          home-manager.backupFileExtension = "backup";
        }
        hosts.nixosModule
        ./modules/hosts.nix
      ];
    };

    nixosConfigurations.hyprland = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hostfiles/active/configuration.nix
        ./modules/global.nix
        ./modules/graphical.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jack = {
            imports = [
              ./home
              ./home/graphical.nix
            ];
          };
          home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
          home-manager.backupFileExtension = "backup";
        }
        hosts.nixosModule
        ./modules/hosts.nix
      ];
    };

    nixosConfigurations.gnome = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hostfiles/active/configuration.nix
        ./modules/global.nix
        ./modules/gnome.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jack = {
            imports = [
              ./home
              ./home/gnome.nix
              ./programs/graphical.nix
            ];
          };
          home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
          home-manager.backupFileExtension = "backup";
        }
        hosts.nixosModule
        ./modules/hosts.nix
      ];
    };

    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hostfiles/active/configuration.nix
        ./modules/global.nix
        ./modules/server.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jack = {
            imports = [
              ./home
            ];
          };
          home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
          home-manager.backupFileExtension = "backup";
        }
        hosts.nixosModule
        ./modules/hosts.nix
      ];
    };

  };
}
