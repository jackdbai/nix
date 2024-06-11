{
  description = "jackdbai";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hosts = {
      url = github:StevenBlack/hosts;
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-24.05";
    };
  };

  outputs = { self, hosts, home-manager, nixpkgs, ... }: {

    nixosConfigurations = {
      "exodus" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /* ./modules */
          ./hosts/exodus
          ./roles/stable.nix
          home-manager.nixosModules.home-manager
          (./homes/stable.nix)
          # Enable stevenblack host file
          hosts.nixosModule
          (./modules/sbhosts.nix)
        ];
      };
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
    };

  };
}
