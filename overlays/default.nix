# ./overlays/default.nix
{ config, pkgs, lib, inputs, ... }:

{
  # in example
  pkgs = import nixpkgs {
    overlays = [ inputs.senpai.overlays.default ];
  };
}
