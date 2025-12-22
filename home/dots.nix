{ config, ... }:

let
  mkOutOfStoreSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configDir = "${config.home.homeDirectory}/git/nix/dotfiles";
in
{
  home.file = {
    ".config/ghostty".source = mkOutOfStoreSymlink "${configDir}/ghostty";
    ".config/hypr".source = mkOutOfStoreSymlink "${configDir}/hyprland";
    ".config/swaync".source = mkOutOfStoreSymlink "${configDir}/swaync";
    ".config/waybar".source = mkOutOfStoreSymlink "${configDir}/waybar";
    ".config/wofi".source = mkOutOfStoreSymlink "${configDir}/wofi";
  };
}
