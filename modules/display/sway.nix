{ config, inputs, lib, pkgs, ... } :

{
  # Settings for Sway
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
    };
  };
}
