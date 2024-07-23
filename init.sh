#!/bin/sh

### SET ENVIRONMENT VARIABLE MACHINE TO THE DESIRED HOSTNAME (also change it in configuration.nix)

mkdir ~/git/
curl -L "https://github.com/jackdbai/nix/tarball/master" | tar xz -C ~/git
mv ~/git/jackdbai* ~/git/nix
rm -r ~/git/nix/hosts/$MACHINE/*
cp /etc/nixos/* ~/git/nix/hosts/$MACHINE/.
mv ~/git/nix/hosts/$MACHINE/configuration.nix ~/git/nix/hosts/$MACHINE/default.nix
sudo rm -rf /etc/nixos/*
sudo cp -r ~/git/nix/* /etc/nixos/.
cd ~/git/nix
sudo nixos-rebuild switch --flake .#$MACHINE