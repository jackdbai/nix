{ config, pkgs, ... }:

{
  home.username = "jack";
  home.homeDirectory = "/home/jack";

  # Enable significant programs
  programs.gh.enable = true;
  programs.home-manager.enable = true;

  # Bash settings # TODO switch to zsh
  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your cusotm bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
    shellAliases = {
      # TODO add aliases
    };
  };

  home.stateVersion = "22.11";

}
