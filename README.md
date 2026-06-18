# NixOS Configuration Flake

This repository contains the NixOS flake configurations for my machines: a universal CLI-only (`tui`) target, a `hyprland` desktop target, a `gnome` desktop target, and a CLI-only `server` target.

## Directory Structure

```text
├── dotfiles/          # Symlinked config files (Ghostty, Hyprland, Waybar, Wofi, etc.)
├── hostfiles/         # Host-specific settings
│   ├── exodus/        # Configuration for the graphical laptop
│   ├── perpetua/      # Configuration for the MBP 11,5 (TUI target)
│   └── build-settings.nix # Interactive build configurations (Ham, TexLive, Android Studio)
├── home/              # Home-manager configuration
│   ├── default.nix    # Base home settings and CLI packages (universal)
│   ├── gnome.nix      # GNOME-specific configurations (extensions, keybindings, etc.)
│   └── graphical.nix  # Graphical user environments, apps, and dotfiles symlinks
├── modules/           # Reusable NixOS system modules
│   ├── boot.nix       # Plymouth and boot loader settings
│   ├── fonts.nix      # Fonts config
│   ├── global.nix     # Base universal CLI/TUI system settings
│   ├── gnome.nix      # GNOME system desktop configuration
│   ├── graphical.nix  # Consolidated Hyprland system desktop configurations
│   ├── hyprland.nix   # Hyprland window manager and desktop ecosystem
│   ├── mbp.nix        # MacBook Pro hardware fixes (AMD GPU blacklist, Intel video drivers)
│   ├── networking.nix # CLI network configuration
│   └── server.nix     # OpenSSH and firewall settings for server targets
├── programs/          # Package definitions
│   ├── cli.nix        # Universal CLI utility list
│   └── graphical.nix  # Desktop application list (Chrome, VSCodium, Obsidian, etc.)
├── flake.nix          # Entry point defining system outputs
└── build.sh           # Interactive builder and module configurator
```

---

## Flake Configurations

There are four primary targets defined in [flake.nix](file:///home/jack/Documents/GitHub/nix/flake.nix):

1. **`tui`** (runs on host `perpetua` MBP by default)
   - Zero graphical server components, display managers, or desktop window managers.
   - Installs only CLI packages and universal tools.

2. **`hyprland`** (runs on host `exodus` laptop by default)
   - Full Wayland session powered by **Hyprland** and SDDM.
   - Complete GUI suite (Google Chrome, VSCodium, Obsidian, Burp Suite, etc.).

3. **`gnome`** (runs on host `exodus` laptop by default)
   - Full GNOME desktop environment using GDM.
   - Tailored GNOME settings, extensions, and the complete GUI suite.

4. **`server`** (runs on any headless/server host)
   - Zero graphical components, display managers, or desktop window managers.
   - Configures system as a headless server (enables OpenSSH daemon, opens port 22 in the firewall, and disables sleep/suspend power targets so it stays online).
   - Installs universal CLI packages and home configs.

---

## Installation & Bootstrap (Fresh Machine)

You can bootstrap a fresh NixOS installation in a single command. 

1. Boot into the NixOS installer or a fresh NixOS installation.
2. Enter a shell with Git:
   ```bash
   nix-shell -p git
   ```
3. Run the build script:
   ```bash
   curl -sSf https://raw.githubusercontent.com/jackdbai/nix/main/build.sh | bash
   ```
The script will clone the repo into `~/Documents/GitHub/nix`, prompt you to choose the configuration profile and optional modules, copy your existing `/etc/nixos/hardware-configuration.nix` automatically, and compile your selected profile.

---

## Rebuilding the System

Once installed, custom ZSH shell aliases are configured in [home/default.nix](file:///home/jack/Documents/GitHub/nix/home/default.nix) to run the interactive configuration and builder script:

- **`rebuild`**: Runs the interactive configuration builder.
  ```bash
  ~/Documents/GitHub/nix/build.sh
  ```
- **`upgrade`**: Updates the Nix flake inputs and triggers the interactive configuration builder.
  ```bash
  nix flake update && ~/Documents/GitHub/nix/build.sh
  ```
- **`cleanup`**: Runs the garbage collector to remove old system profiles:
  ```bash
  sudo nix-collect-garbage -d
  ```