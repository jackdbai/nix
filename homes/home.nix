{ config, pkgs, ... }:

{
  # home.username = "jack";
  # home.homeDirectory = "/home/jack";

  # Enable significant programs
  programs.gh.enable = true;
  programs.home-manager.enable = true;

  # Shell settings #
  programs.zsh = {
    enable = true;
    shellAliases = {
      # TODO add aliases
      "adblist"="adb shell pm list packages";
      "adblistu"="diff <(adb shell pm list packages) <(adb shell pm list packages -u)";
      "adbreinst"="adb shell cmd package install-existing";
      "adbuninst"="adb shell pm uninstall --user 0";
      "cleanup"="sudo nix-collect-garbage -d && sudo nixos-rebuild switch";
      "gc"="sudo nix-collect-garbage -d";
      "rebuild-asahi" = "cp ~/nix/hostfiles/* ~/.nixbackups/. && cd ~/nix && sudo rm -rf /etc/nixos/* && sudo cp -r ./* /etc/nixos/. && sudo nixos-rebuild switch --flake .#asahi";
      "rebuild-dev" = "cp ~/nix/hostfiles/* ~/.nixbackups/. && cd ~/nix && sudo rm -rf /etc/nixos/* && sudo cp -r ./* /etc/nixos/. && sudo nixos-rebuild switch --flake .#dev";
      "rebuild-ham" = "cp ~/nix/hostfiles/* ~/.nixbackups/. && cd ~/nix && sudo rm -rf /etc/nixos/* && sudo cp -r ./* /etc/nixos/. && sudo nixos-rebuild switch --flake .#ham";
      "rebuild-server" = "cp ~/nix/hostfiles/* ~/.nixbackups/. && cd ~/nix && sudo rm -rf /etc/nixos/* && sudo cp -r ./* /etc/nixos/. && sudo nixos-rebuild switch --flake .#server";
      "rebuild-stable" = "cp ~/nix/hostfiles/* ~/.nixbackups/. && cd ~/nix && sudo rm -rf /etc/nixos/* && sudo cp -r ./* /etc/nixos/. && sudo nixos-rebuild switch --flake .#stable";
      "regit" = "cd ~/git/nix && git pull && sudo rm -rf /etc/nixos/* && sudo cp -r /home/jack/git/nix/* /etc/nixos/. && sudo nixos-rebuild switch";
      "upgrade" = "sudo nixos-rebuild switch --upgrade";
    };
  };

  home.stateVersion = "22.11";
}
