# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/9701ed3a-646d-4b6c-807c-45e67f59ce38";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-215d05f2-f651-4b8d-b737-e90ebef05c35".device = "/dev/disk/by-uuid/215d05f2-f651-4b8d-b737-e90ebef05c35";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/7E0B-B97B";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/880d4585-aa7c-42d9-9be7-5a1766bd0056"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
