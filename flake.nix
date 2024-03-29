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
    hosts = {
      url = github:StevenBlack/hosts;
    };
    nixpkgs = {
      url = "github:NixOS/nixpkgs/master";
    };
  };

  outputs = { self, hosts, home-manager, nixpkgs, ... }: {

    nixosConfigurations = {
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
      "flannery" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /* ./modules */
          ./hosts/flannery
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
