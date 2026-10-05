{
  description = "Jack's NixOS Setup";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hosts.url = "github:StevenBlack/hosts";
    llm-agents.url = "github:numtide/llm-agents.nix";
    nixos-apple-silicon.url = "github:tpwrules/nixos-apple-silicon";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
  };

  outputs = { self, home-manager, hosts, llm-agents, nixpkgs, nixos-apple-silicon, ... } @ inputs: {

    nixosConfigurations.dev = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./modules/boot.nix
        ./hostfiles/active/configuration.nix
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

    nixosConfigurations.mbp = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./modules/boot.nix
        ./modules/mbp.nix
        ./hostfiles/active/configuration.nix
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

    nixosConfigurations.nvidia = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./modules/boot.nix
        ./modules/nvidia.nix
        ./hostfiles/active/configuration.nix
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

    nixosConfigurations.stable = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./modules/boot.nix
        ./hostfiles/active/configuration.nix
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

    nixosConfigurations.apple-silicon = nixos-apple-silicon.inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        nixos-apple-silicon.nixosModules.default
        ./modules/apple-silicon.nix
        ./hostfiles/active/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jack = {
            imports = [
              ./home
            ];
          };
          home-manager.extraSpecialArgs = { inherit inputs; system = "aarch64-linux"; };
          home-manager.backupFileExtension = "backup";
          home-manager.users.jack.home.enableNixpkgsReleaseCheck = false;
        }
        hosts.nixosModule
        ./modules/hosts.nix
      ];
    };

    nixosConfigurations.asahi = self.nixosConfigurations.apple-silicon;

  };
}
