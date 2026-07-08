#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Get the real physical directory of this script, following symlinks
SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

# Default values
TARGET_HOST=""
USE_DEV_FLAKE=false

# Simple argument parsing
while [[ $# -gt 0 ]]; do
    case "$1" in
        -d|--dev)
            USE_DEV_FLAKE=true
            shift
            ;;
        *)
            if [ -z "$TARGET_HOST" ]; then
                TARGET_HOST="$1"
            else
                echo "Unknown argument: $1"
                exit 1
            fi
            shift
            ;;
    esac
done

# Default TARGET_HOST to current hostname if not specified
if [ -z "$TARGET_HOST" ]; then
    TARGET_HOST=$(hostname)
fi

HOST_DIR="$SCRIPT_DIR/hostfiles/$TARGET_HOST"

# Handle fresh installations (hostname is "nixos")
if [ "$TARGET_HOST" = "nixos" ]; then
    echo "Detected hostname 'nixos' (fresh installation)."
    
    # Prompt for a new hostname
    NEW_HOSTNAME=""
    while [ -z "$NEW_HOSTNAME" ]; do
        read -p "Enter new hostname for this machine: " NEW_HOSTNAME
        # Trim leading/trailing whitespace
        NEW_HOSTNAME=$(echo "$NEW_HOSTNAME" | xargs)
    done
    
    HOST_DIR="$SCRIPT_DIR/hostfiles/$NEW_HOSTNAME"
    if [ -d "$HOST_DIR" ]; then
        echo "Directory '$HOST_DIR' already exists. Reusing it."
    else
        echo "Creating new host directory: $HOST_DIR"
        mkdir -p "$HOST_DIR"
        
        # Copy configuration files from the machine's /etc/nixos
        if [ -f /etc/nixos/configuration.nix ] && [ -f /etc/nixos/hardware-configuration.nix ]; then
            echo "Copying configuration files from /etc/nixos/..."
            cp /etc/nixos/configuration.nix "$HOST_DIR/"
            cp /etc/nixos/hardware-configuration.nix "$HOST_DIR/"
            
            # Substitute the hostname in configuration.nix
            echo "Setting hostname to '$NEW_HOSTNAME' in $HOST_DIR/configuration.nix..."
            if grep -q "networking.hostName" "$HOST_DIR/configuration.nix"; then
                sed -i -E 's/(networking\.hostName\s*=\s*")[^"]*(";)/\1'"$NEW_HOSTNAME"'\2/' "$HOST_DIR/configuration.nix"
            else
                # If not present, append it before the final closing brace
                sed -i '/^}/i \  networking.hostName = "'"$NEW_HOSTNAME"'";' "$HOST_DIR/configuration.nix"
            fi
        else
            echo "Error: Could not find /etc/nixos/configuration.nix or /etc/nixos/hardware-configuration.nix"
            exit 1
        fi
    fi
    
    # Update target host to the new hostname
    TARGET_HOST="$NEW_HOSTNAME"
    HOST_DIR="$SCRIPT_DIR/hostfiles/$TARGET_HOST"
    
    # Stage the new files in Git so Nix can see them
    if git -C "$SCRIPT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Staging new configuration files in Git..."
        git -C "$SCRIPT_DIR" add "$HOST_DIR"
    fi
fi

# Verify host directory exists
if [ ! -d "$HOST_DIR" ]; then
    echo "Error: Host configuration directory '$HOST_DIR' does not exist."
    echo "Please create the directory '$HOST_DIR' with configuration.nix and hardware-configuration.nix first."
    exit 1
fi

# Set up active symlink pointing to target host
echo "Setting active host configuration to: '$TARGET_HOST' ($HOST_DIR)"
# We use relative symlink target so Nix Flakes can resolve it inside the repository context
ln -sfn "$TARGET_HOST" "$SCRIPT_DIR/hostfiles/active"

# Ensure the active symlink is tracked by Git so Nix flakes can see it
if git -C "$SCRIPT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Staging hostfiles/active symlink in Git..."
    git -C "$SCRIPT_DIR" add "$SCRIPT_DIR/hostfiles/active"
fi

# Hardware Detection Functions
is_macbook() {
    if [ -f /sys/class/dmi/id/sys_vendor ] && grep -qi "Apple" /sys/class/dmi/id/sys_vendor; then
        return 0
    fi
    if [ -f /sys/class/dmi/id/product_name ] && grep -qi "MacBook" /sys/class/dmi/id/product_name; then
        return 0
    fi
    return 1
}

has_nvidia_gpu() {
    # Check PCI devices for Nvidia Vendor ID (10de)
    if [ -d /sys/bus/pci/devices ]; then
        for f in /sys/bus/pci/devices/*/vendor; do
            if [ -f "$f" ] && grep -qi "0x10de" "$f"; then
                return 0
            fi
        done
    fi
    return 1
}

# Auto-detect flake target based on hardware
FLAKE_TARGET="stable"
HARDWARE_REASON="No special hardware detected; using standard configuration"

if [ "$USE_DEV_FLAKE" = true ]; then
    FLAKE_TARGET="dev"
    HARDWARE_REASON="Dev flake requested via flag"
elif is_macbook; then
    FLAKE_TARGET="mbp"
    HARDWARE_REASON="MacBook hardware detected"
elif has_nvidia_gpu; then
    FLAKE_TARGET="nvidia"
    HARDWARE_REASON="NVIDIA GPU detected"
fi

echo "Selected flake target: '$FLAKE_TARGET' ($HARDWARE_REASON)"
echo "Executing: sudo nixos-rebuild switch --flake $SCRIPT_DIR#$FLAKE_TARGET"

sudo nixos-rebuild switch --flake "$SCRIPT_DIR#$FLAKE_TARGET"
