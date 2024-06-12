{ config, pkgs, ... }:

{
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    curl
    git
    wget
    vim
  ];

  # Enable printing
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable graphical environment (NOT STRICTLY X)
  services.xserver.enable = true;

  # Enable the GNOME/Sway Desktop Environment.
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
  services.xserver.desktopManager.gnome.enable = true;

  # Enable programs
  programs.adb.enable = true;
  # programs.hyprland.enable = true;
  # programs.sway.enable = true;
  programs.zsh.enable = true;

  # Permit Insecure Packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jack = {
    isNormalUser = true;
    description = "Jack";
    extraGroups = [ "networkmanager" "wheel" "docker" "adbusers" ];
    shell = pkgs.zsh;
  };

  # Enable podman
  virtualisation = {
    /* virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    }; */
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
