#!/bin/sh

echo "Please enter a hostname:"
read $MACHINE
curl -L "https://github.com/jackdbai/nix/tarball/master" | tar xz -C ~/
mv $PWD/jackdbai* ~/nix
mkdir ~/nix/hostfiles
sed 's/nixos/'$MACHINE'/g' /etc/nixos/configuration.nix > ~/nix/hostfiles/default.nix
cp /etc/nixos/hardware-configuration.nix ~/nix/hostfiles/.
mkdir ~/.nixbackups
cp -r ~/nix/hostfiles ~/.nixbackups
sudo rm -rf /etc/nixos/*
sudo cp -r ~/nix/* /etc/nixos/.
cd ~/nix
sudo nixos-rebuild switch --flake .#ham