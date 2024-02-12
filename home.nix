{ config, pkgs, ... }:

{
  home.username = "jack";
  home.homeDirectory = "/home/jack";

  # Enable significant programs
  programs.gh.enable = true;
  programs.home-manager.enable = true;

  # programs.zsh.enable = true;

  # home.shell = pkgs.zsh;

  # Bash settings # TODO switch to zsh
  programs.zsh = {
    enable = true;
    # enableCompletion = true;
    # TODO add your cusotm bashrc here
    # bashrcExtra = ''
    #   export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    # '';
    shellAliases = {
      # TODO add aliases
      "rebuild" = "sudo rm -rf /etc/nixos/* && sudo cp -r /home/jack/git/nix/* /etc/nixos/. && sudo nixos-rebuild switch";
      "adblist"="adb shell pm list packages";
      "adblistu"="diff <(adb shell pm list packages) <(adb shell pm list packages -u)";
      "adbreinst"="adb shell cmd package install-existing";
      "adbuninst"="adb shell pm uninstall --user 0";
    };
  };

  home.stateVersion = "22.11";

}
