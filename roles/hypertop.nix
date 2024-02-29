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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME/Sway Desktop Environment.
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
  /* services.xserver.desktopManager.gnome.enable = true; */
  programs.sway.enable = true;

  # Enable zsh
  programs.zsh.enable = true;

  # Permit Insecure Packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
    "pulsar-1.109.0"
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jack = {
    isNormalUser = true;
    description = "Jack";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

}
