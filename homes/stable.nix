{ config, lib, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit (config.networking) hostName;
    };
    users.jack = {...}: {
      imports = [
        ./home.nix
        ../programs/cli.nix
        ../programs/graphical.nix
        # ../programs/ham.nix
        ../programs/texlive.nix
      ];

      ### dconf settings that I usually change immediately on installing a GNOME DE
      dconf.settings = {
        "org/gnome/settings-daemon/plugins/power" = {
          sleep-inactive-ac-type = "nothing";
          power-button-action = "nothing";
        };
        "org/gnome/desktop/peripherals/touchpad" = {
          tap-to-click = false;
          click-method = "'fingers'";
        };
        "org/gnome/desktop/session/" = {
          idle-delay = "uint32 0";
        };
        "org/gnome/mutter" = {
          dynamic-workspaces = true;
        };
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          enable-hot-corners = false;
        };
        "org/gnome/desktop/background" = {
          picture-uri = "hhttps://upload.wikimedia.org/wikipedia/commons/4/4d/Saint_Jerome_Writing-Caravaggio_%281605-6%29.jpg";
          picture-uri-dark = "https://upload.wikimedia.org/wikipedia/commons/4/4d/Saint_Jerome_Writing-Caravaggio_%281605-6%29.jpg";
          picture-options = "zoom";
        };
        "org/gnome/shell" = {
          favorite-apps = [
            "org.gnome.Nautilus.desktop"
            "brave-browser.desktop"
            "org.gnome.Calendar.desktop"
            "discord.desktop"
            "github-desktop.desktop"
            "obsidian.desktop"
            "codium.desktop"
            "org.gnome.Console.desktop"
          ];
        };
      };
    };
  };
}
