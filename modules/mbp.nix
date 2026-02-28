{ config, pkgs, inputs, libs, ... }:

{
  # Prevent AMD GPU driver from loading
  boot.blacklistedKernelModules = [
    "radeon"
    "amdgpu"
  ];

  # Make sure only Intel driver is used
  services.xserver.videoDrivers = [ "modesetting" ];

  # Disable kernel modesetting for AMD just in case
  boot.kernelParams = [
    "modprobe.blacklist=radeon"
    "modprobe.blacklist=amdgpu"
  ];

}

# https://chatgpt.com/s/t_699e8d1d0d9c8191a10413d375a779b5