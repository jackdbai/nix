#!/bin/sh

mkdir ~/git/
curl -L "https://github.com/jackdbai/nix/tarball/master" | tar xz -C ~/git
mv ~/git/jackdbai* ~/git/nix
rm -r ~/git/nix/hosts/alita/*
cp /etc/nixos/* ~/git/nix/hosts/alita/.
mv ~/git/nix/hosts/alita/configuration.nix ~/git/nix/hosts/alita/default.nix
sudo rm -rf /etc/nixos/*
sudo cp -r ~/git/nix/* /etc/nixos/.
cd ~/git/nix
sudo nixos-rebuild switch --flake .#alita
