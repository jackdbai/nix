#!/usr/bin/env bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== NixOS Configuration Builder ===${NC}"

# Check for git
if ! command -v git &> /dev/null; then
    echo -e "${RED}Error: git is not installed. Please run: nix-shell -p git${NC}"
    exit 1
fi

# Determine repo directory based on this script's path
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Determine hostname and host configuration folder
CURRENT_HOSTNAME=$(hostname)
HOST_DIR="$CURRENT_HOSTNAME"
IS_FRESH_INSTALL=false

# Only prompt for hostname if the configuration directory for the current host doesn't exist
if [ ! -d "$REPO_DIR/hostfiles/$CURRENT_HOSTNAME" ]; then
    echo -e "${BLUE}No existing host configuration folder found for hostname '$CURRENT_HOSTNAME'.${NC}"
    read -rp "Enter the desired hostname for this system [default: $CURRENT_HOSTNAME]: " input_hostname
    HOSTNAME_TO_USE="${input_hostname:-$CURRENT_HOSTNAME}"
    HOST_DIR="$HOSTNAME_TO_USE"

    # If the user-selected hostname configuration also doesn't exist, it's a fresh install
    if [ ! -d "$REPO_DIR/hostfiles/$HOST_DIR" ]; then
        IS_FRESH_INSTALL=true
    else
        echo -e "${RED}Warning: Configuration folder for host '$HOST_DIR' already exists.${NC}"
        read -rp "Do you want to overwrite it with the system's current /etc/nixos configuration? [y/N]: " overwrite_choice
        case "$overwrite_choice" in
            [yY][eE][sS]|[yY])
                IS_FRESH_INSTALL=true
                ;;
            *)
                echo -e "${BLUE}Keeping existing configuration for '$HOST_DIR'.${NC}"
                ;;
        esac
    fi
fi

if [ "$IS_FRESH_INSTALL" = "true" ]; then
    echo -e "${BLUE}Setting up configuration files for host '$HOST_DIR'...${NC}"
    mkdir -p "$REPO_DIR/hostfiles/$HOST_DIR"

    # Copy system configuration.nix from /etc/nixos
    if [ -f "/etc/nixos/configuration.nix" ]; then
        echo -e "${GREEN}Copying /etc/nixos/configuration.nix to hostfiles/$HOST_DIR/configuration.nix...${NC}"
        cp /etc/nixos/configuration.nix "$REPO_DIR/hostfiles/$HOST_DIR/configuration.nix"
        
        # Modify configuration.nix to set custom hostname
        if grep -q "networking.hostName" "$REPO_DIR/hostfiles/$HOST_DIR/configuration.nix"; then
            sed -i 's/\(# \)\?networking.hostName = .*/networking.hostName = "'"$HOST_DIR"'";/' "$REPO_DIR/hostfiles/$HOST_DIR/configuration.nix"
        else
            sed -i 's/^}$/  networking.hostName = "'"$HOST_DIR"'";\n}/' "$REPO_DIR/hostfiles/$HOST_DIR/configuration.nix"
        fi

        # Disable pre-configured desktop environment or display managers in the copied configuration.nix
        echo -e "${GREEN}Commenting out display managers and desktop environment packages in new configuration.nix...${NC}"
        sed -i 's/^\([[:space:]]*\)\(services\.xserver\.enable[[:space:]]*=[[:space:]]*true\)/# \1\2/' "$REPO_DIR/hostfiles/$HOST_DIR/configuration.nix"
        sed -i 's/^\([[:space:]]*\)\(services\.displayManager\..*\.enable[[:space:]]*=[[:space:]]*true\)/# \1\2/' "$REPO_DIR/hostfiles/$HOST_DIR/configuration.nix"
        sed -i 's/^\([[:space:]]*\)\(services\.desktopManager\..*\.enable[[:space:]]*=[[:space:]]*true\)/# \1\2/' "$REPO_DIR/hostfiles/$HOST_DIR/configuration.nix"
        sed -i 's/^\([[:space:]]*\)\(services\.xserver\.desktopManager\..*\.enable[[:space:]]*=[[:space:]]*true\)/# \1\2/' "$REPO_DIR/hostfiles/$HOST_DIR/configuration.nix"
        sed -i 's/^\([[:space:]]*\)\(services\.xserver\.displayManager\..*\.enable[[:space:]]*=[[:space:]]*true\)/# \1\2/' "$REPO_DIR/hostfiles/$HOST_DIR/configuration.nix"
    else
        echo -e "${RED}Warning: /etc/nixos/configuration.nix not found! Creating minimal configuration.nix...${NC}"
        cat <<EOF > "$REPO_DIR/hostfiles/$HOST_DIR/configuration.nix"
{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  networking.hostName = "$HOST_DIR";
  system.stateVersion = "24.05";
}
EOF
    fi

    # Copy hardware-configuration.nix from /etc/nixos
    if [ -f "/etc/nixos/hardware-configuration.nix" ]; then
        echo -e "${GREEN}Copying /etc/nixos/hardware-configuration.nix to hostfiles/$HOST_DIR/hardware-configuration.nix...${NC}"
        cp /etc/nixos/hardware-configuration.nix "$REPO_DIR/hostfiles/$HOST_DIR/hardware-configuration.nix"
    fi

    git -C "$REPO_DIR" add "$REPO_DIR/hostfiles/$HOST_DIR"
fi

# Point active symlink to targeted host directory
echo -e "${BLUE}Pointing hostfiles/active symlink to ./$HOST_DIR...${NC}"
ln -sfn "./$HOST_DIR" "$REPO_DIR/hostfiles/active"
git -C "$REPO_DIR" add "$REPO_DIR/hostfiles/active"

# Choice of configuration profile
echo -e "\n${BLUE}Select the configuration flake to build:${NC}"
echo "1) tui        (GUI-less, CLI-only console environment)"
echo "2) hyprland   (Full Hyprland Wayland environment)"
echo "3) gnome      (GNOME desktop environment)"
echo "4) server     (GUI-less, CLI-only Server environment with OpenSSH)"
read -rp "Enter choice [1-4]: " choice

case $choice in
    1) ROLE="tui" ;;
    2) ROLE="hyprland" ;;
    3) ROLE="gnome" ;;
    4) ROLE="server" ;;
    *)
        echo -e "${RED}Invalid choice. Exiting.${NC}"
        exit 1
        ;;
esac

echo -e "\n${BLUE}Selected profile: $ROLE (uses host configuration under: hostfiles/active/)${NC}"

# Configure optional modules
confirm_module() {
    local prompt=$1
    local choice
    read -rp "$prompt [y/N]: " choice
    case "$choice" in
        [yY][eE][sS]|[yY])
            echo "true"
            ;;
        *)
            echo "false"
            ;;
    esac
}

echo -e "\n${BLUE}Configure optional home modules:${NC}"
HAM_ENABLED=$(confirm_module "Enable Ham Radio tools?")
TEXLIVE_ENABLED=$(confirm_module "Enable TexLive?")
ANDROIDSTUDIO_ENABLED=$(confirm_module "Enable Android Studio?")

# Detect hardware
IS_MBP=false
if [ -f "/sys/class/dmi/id/product_name" ] && [ "$(cat /sys/class/dmi/id/product_name)" = "MacBookPro11,5" ]; then
    echo -e "${GREEN}Detected hardware: MacBookPro11,5${NC}"
    IS_MBP=true
elif [ -f "/sys/devices/virtual/dmi/id/product_name" ] && [ "$(cat /sys/devices/virtual/dmi/id/product_name)" = "MacBookPro11,5" ]; then
    echo -e "${GREEN}Detected hardware: MacBookPro11,5${NC}"
    IS_MBP=true
fi

HAS_NVIDIA=false
if grep -qi "0x10de" /sys/bus/pci/devices/*/vendor 2>/dev/null; then
    echo -e "${GREEN}Detected NVIDIA GPU hardware${NC}"
    HAS_NVIDIA=true
fi

# Write settings
cat <<EOF > "$REPO_DIR/hostfiles/build-settings.nix"
{
  ham = { enable = $HAM_ENABLED; };
  texlive = { enable = $TEXLIVE_ENABLED; };
  androidstudio = { enable = $ANDROIDSTUDIO_ENABLED; };
  hardware = {
    isMacBook = $IS_MBP;
    hasNvidia = $HAS_NVIDIA;
  };
}
EOF

# Stage settings so Nix flake can see them
git -C "$REPO_DIR" add "$REPO_DIR/hostfiles/build-settings.nix"

# If we are on an existing host, copy hardware-configuration.nix if changed
if [ -f "/etc/nixos/hardware-configuration.nix" ]; then
    if [ ! -f "$REPO_DIR/hostfiles/$HOST_DIR/hardware-configuration.nix" ] || ! cmp -s "/etc/nixos/hardware-configuration.nix" "$REPO_DIR/hostfiles/$HOST_DIR/hardware-configuration.nix"; then
        echo -e "${GREEN}Updating local hardware-configuration.nix in host directory...${NC}"
        cp /etc/nixos/hardware-configuration.nix "$REPO_DIR/hostfiles/$HOST_DIR/hardware-configuration.nix"
        git -C "$REPO_DIR" add "$REPO_DIR/hostfiles/$HOST_DIR/hardware-configuration.nix"
    fi
fi

# Run build
echo -e "\n${BLUE}Rebuilding system using flake $REPO_DIR#$ROLE...${NC}"
sudo nixos-rebuild switch --flake "$REPO_DIR#$ROLE"

echo -e "\n${GREEN}=== System Rebuild Completed Successfully! ===${NC}"
