{ config, pkgs, inputs, ... }:

{
  imports = [
    ../programs/graphical.nix
    ./dots.nix
  ];
}
