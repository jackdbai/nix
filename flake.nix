{
  description = "jackdbai";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    hosts = {
      url = github:StevenBlack/hosts;
    };
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-23.11";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = { self, darwin, hosts, nix-homebrew, homebrew-bundle, homebrew-core, homebrew-cask, home-manager, nixpkgs, ... }: {
    darwinConfigurations = {
      #eventually
    };

    nixosConfigurations = {
     "alita" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /* ./modules */
          ./hosts/alita
          ./roles/stable.nix
          home-manager.nixosModules.home-manager
          (./homes/stable.nix)
          # Enable stevenblack host file
          hosts.nixosModule
          (./modules/sbhosts.nix)
        ];
      };

      "elle" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /* ./modules */
          ./hosts/elle
          ./roles/dev.nix
          home-manager.nixosModules.home-manager
          (./homes/dev.nix)
          # Enable stevenblack host file
          hosts.nixosModule
          (./modules/sbhosts.nix)
        ];
      };

      "nixvm" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixvm
          ./roles/dev.nix
          home-manager.nixosModules.home-manager
          (./homes/dev.nix)
        ];
      };
    };
  };
}
