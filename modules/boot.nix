{ config, pkgs, inputs, ... }:

{
  # Nice Plymouth boot screen
  boot = {
    plymouth = {
      enable = true;
      theme = "bgrt";
    };

    # Silent boot for speed and clean look
    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "systemd.show_status=auto"
    ];

    consoleLogLevel = 0;

    # Fast boot timeout (updated option name)
    loader.timeout = 1;

    # Beautiful GRUB theme
    loader.grub.theme = pkgs.nixos-grub2-theme;

    # Keep boot entries clean
    loader.grub.configurationLimit = 5;

    # LUKS + Plymouth integration for themed password prompts
    initrd.systemd.enable = true;
  };
}
