#!/bin/sh

if command -v git &> /dev/null; then
  echo "Installing Jack's NixOS Configs..."
  echo "-----"
else
  echo "Git is not available."
  echo "Please do: nix-shell -p git"
  exit
fi
read -rp "Please enter a hostname: " MACHINE
git clone https://github.com/jackdbai/nix ~/git/nix
cd ~/git/nix
rm -r ./hostfiles/*
mkdir ./hostfiles/"$MACHINE"
sed 's/nixos/'$MACHINE'/g' /etc/nixos/configuration.nix > ./hostfiles/"$MACHINE"/default.nix
cp /etc/nixos/hardware-configuration.nix ./hostfiles/"$MACHINE"/.
git config --global user.name "installer"
git config --global user.email "installer@jackdbai.dev"
git add .
sudo nixos-rebuild switch --flake ~/git/nix#stable
