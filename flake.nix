{
  description = "Jack's NixOS Setup";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    browseros.url = "github:jackdbai/browseros-flake";
    home-manager = {
      # url = "github:nix-community/home-manager/master";
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hosts.url = "github:StevenBlack/hosts";
    # nixpkgs.url = "github:nixos/nixpkgs/master";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    #nix73.url = "/home/jack/Documents/GitHub/nix73";
  };

  outputs = { self, browseros, home-manager, hosts, nixpkgs, ... } @ inputs: {

    nixosConfigurations.main = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./modules/boot.nix
        #inputs.nix73.nixosModules.hamRadioEnv
        ./hostfiles/configuration.nix
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
