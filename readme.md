## Initialization

1. Enable git and set hostname via `configuration.nix`
2. Clone repo into `~/git`
3. Replace `../nix/hosts/$HOST/*` files with `/etc/nixos/*`
4. ```cd ~/git/nix && git pull && sudo rm -rf /etc/nixos/* && sudo cp -r /home/jack/git/nix/* /etc/nixos/. && sudo nixos-rebuild switch```
5. Reboot
