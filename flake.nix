{
  description = "jackdbai";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hosts = {
      url = github:StevenBlack/hosts;
    };
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-23.11";
    };
  };

  outputs = { self, hosts, home-manager, nixpkgs, ... }: {
    darwinConfigurations = {
      #eventually
    };

    nixosConfigurations = {
      "elle" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /* ./modules */
          ./hosts/elle
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
