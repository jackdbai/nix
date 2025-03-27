{ config, pkgs, home-manager, ... }:

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

  # Enable gnome-keyring
  services.gnome.gnome-keyring.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable greetd login
  /* services.greetd = {
    enable = true;
    settings = {
      default_session.command = ''
       ${pkgs.greetd.tuigreet}/bin/tuigreet \
         --time \
         --asterisks \
         --user-menu \
         --cmd sway
      '';
    };
  };

  environment.etc."greetd/environments".text = ''
    sway
  ''; */

  # Enable the GNOME/Sway Desktop Environment.
  # services.xserver.displayManager.gdm = {
  #   enable = true;
  #   wayland = true;
  # };
  # services.xserver.desktopManager.gnome.enable = true;

  services.xserver = {
    enable = true;   
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
#        noDesktop = false;
#        enableXfwm = false;
      };
    };
    displayManager.lightdm.enable = true;
#    windowManager.i3.enable = true;
  };
  services.displayManager.defaultSession = "xfce";

  # Enable Hyprland
  #programs.hyprland = {
  #  enable = true;
  #};

  # Enable programs
  programs.adb.enable = true;
  # programs.hyprland.enable = true;
  # programs.sway.enable = true;
  programs.zsh.enable = true;

  #programs.gnupg.agent = {
  #  enable = true;
  #  enableSSHSupport = true;
  #};

  # Permit Insecure Packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-19.1.9"
    "electron-25.9.0"
    "pulsar-1.114.0"
    "openssl-1.1.1w"
  ];

  security.polkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jack = {
    isNormalUser = true;
    description = "Jack";
    extraGroups = [ "networkmanager" "wheel" "docker" "adbusers" ];
    shell = pkgs.zsh;
  };

}
